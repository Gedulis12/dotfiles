import boto3
import json
import datetime
import logging
import decimal
from boto3.dynamodb.conditions import Key, Attr
from botocore.exceptions import ClientError
from boto3.dynamodb.types import Binary


# AWS Setup
session = boto3.Session(profile_name="PROD", region_name="us-east-1")
dynamodb = session.resource("dynamodb")
table = dynamodb.Table("bo.accounts")

# List of userIDs to filter
userID_list = [
    'd5fe9959-f7b2-4926-b06f-79298932905f'
]

# Timestamped backup file
timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
backup_file = f"bo_accounts_backup_{timestamp}.json"


# Handle Decimal types in DynamoDB JSON
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            return int(obj) if obj % 1 == 0 else float(obj)
        if isinstance(obj, Binary):
            try:
                # Try decoding to UTF-8 string
                return obj.value.decode("utf-8")
            except Exception:
                # Fallback: return hex string
                return obj.value.hex()
        return super().default(obj)


def query_by_userID(userID):
    """Query all records for a given userID."""
    response = table.query(
        KeyConditionExpression=Key('userID').eq(userID)
    )
    return response.get('Items', [])


def backup_items(all_items):
    with open(backup_file, "w") as f:
        json.dump(all_items, f, indent=2, cls=DecimalEncoder)
    print(f"✅ Backup written to: {backup_file}")


def update_record(userID, accountID):
    """Update pdtRestricted and status only if pdtRestricted=1 and status=3."""
    table.update_item(
        Key={
            'userID': userID,
            'accountID': accountID
        },
        UpdateExpression="SET pdtRestricted = :p, #st = :s",
        ExpressionAttributeValues={
            ':p': 0,
            ':s': 2
        },
        ExpressionAttributeNames={
            '#st': 'status'
        },
        ConditionExpression=Attr('pdtRestricted').eq(1) & Attr('status').eq(3)
    )
    print(f"🔁 Updated: userID={userID}, accountID={accountID}")


def validate_update(userID, accountID):
    """Validate if update was successful and show new values."""
    response = table.get_item(
        Key={
            'userID': userID,
            'accountID': accountID
        }
    )
    item = response.get("Item")
    if item:
        pdt_restricted = item.get("pdtRestricted")
        status = item.get("status")
        if pdt_restricted == 0 and status == 2:
            print(f"✅ Validation passed for userID={userID}, accountID={accountID} → pdtRestricted={pdt_restricted}, status={status}")
        else:
            print(f"❌ Validation failed for userID={userID}, accountID={accountID} → pdtRestricted={pdt_restricted}, status={status}")
    else:
        print(f"❌ Validation failed: item not found for userID={userID}, accountID={accountID}")


def main():
    all_items = []
    print("🔍 Querying DynamoDB by userID...")

    for userID in userID_list:
        try:
            items = query_by_userID(userID)
            if not items:
                print(f"⚠️ No items found for userID={userID}")
            else:
                all_items.extend(items)
        except Exception as e:
            logging.error(f"❌ Failed to query userID={userID}: {e}")

    if not all_items:
        print("⚠️ No matching records found for any userID.")
        return

    # Step 1: Backup
    backup_items(all_items)

    # Step 2: Update + Validate
    for item in all_items:
        try:
            update_record(item['userID'], item['accountID'])
            validate_update(item['userID'], item['accountID'])
        except ClientError as e:
            if e.response['Error']['Code'] == 'ConditionalCheckFailedException':
                print(f"⚠️ Skipped update: userID={item['userID']}, accountID={item['accountID']} did not meet condition (pdtRestricted=1 AND status=3)")
            else:
                logging.error(f"❌ Failed update for userID={item['userID']}, accountID={item['accountID']}: {e}")
        except Exception as e:
            logging.error(f"❌ Unexpected error for userID={item['userID']}, accountID={item['accountID']}: {e}")


if __name__ == "__main__":
    main()
