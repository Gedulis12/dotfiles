#!/bin/bash

if ! aws --version > /dev/null; then
    echo 'aws not found in PATH'
    exit 1
fi

if ! which fzf > /dev/null; then
    echo 'fzf not found in PATH'
    exit 1
fi

if ! which jq > /dev/null; then
    echo 'jq not found in PATH'
    exit 1
fi


PROFILE=$(aws configure list-profiles | fzf --header='Select AWS profile')

INSTANCE=$(aws ec2 describe-instances --profile $PROFILE | jq -r '
  ["name", "id", "type", "state"],
  (.Reservations[].Instances[]
    | select(.State.Name == "running")
    | [
        ( .Tags // []
            | map(select(.Key == "Name"))
            | map(.Value)
            | first // "N/A" ),
        .InstanceId,
        .InstanceType,
        .State.Name
      ]
      ) | @tsv' | column -s $'\t' -t | fzf --header='Select instance' | awk '{print $2}')

aws ssm start-session --target $INSTANCE --profile $PROFILE
