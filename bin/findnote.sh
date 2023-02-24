#!/bin/bash


#                #             ""#          
#    " #         # mm    mmm     #    mmmm  
#  "#"#""        #"  #  #"  #    #    #" "# 
# mm#m#m         #   #  #""""    #    #   # 
#  # m"          #   #  "#mm"    "mm  ##m#" 
#                                     #     
#                                     "     

help () {
    echo 'The program searches for .md files through notes directory'
    echo 'Notes directory must be specified as $NOTES_DIR environment variable'
    echo 'Options:'
    echo 'h    Prints this message'
    echo 't    Filters notes on tags. Tags must be specified in metadata block like this: '
    echo '     Tags: [tag1, tag2, tag3]'
}

#    " #         mmmmm   mmm   mmm    m mm          mmmm    m mm   mmm    mmmm   m mm   mmm   mmmmm 
#  "#"#""        # # #  "   #    #    #"  #         #" "#   #"  " #" "#  #" "#   #"  " "   #  # # # 
# mm#m#m         # # #  m"""#    #    #   #         #   #   #     #   #  #   #   #     m"""#  # # # 
#  # m"          # # #  "mm"#  mm#mm  #   #         ##m#"   #     "#m#"  "#m"#   #     "mm"#  # # # 
#                                                   #                     m  #                      
#                                                   "                      ""                       

get_tag () {
    tag=$( \
        grep -aHri 'tags: \[' $NOTES_DIR/* | \
        cut -d ":" -f 3 | \
        sed -e 's/[][,]//g' | \
        tr ' ' '\n' | \
        grep "\S" | \
        sort -u | \
        fzf --preview=' \
        grep -aHrie "^Tags: \[.*\]$" $NOTES_DIR/* | \
        grep -i {} | \
        cut -d ":" -f 1 | \
        sort -u' \
        --bind shift-up:preview-page-up,shift-down:preview-page-down \
    )
}

search_by_tag() {
    get_tag
    if [[ ! -z "$tag" ]]
    then
        notefile=$( \
            grep -aHrie "^Tags: \[.*$tag.*\]\$" $NOTES_DIR/* | \
            cut -d ":" -f 1 | \
            sort -u | \
            fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down \
        )
    fi

    if [[ ! -z "$notefile" ]]
    then
        nvim $notefile
    fi
}

search_by_filename() {
    notefile=$(find $NOTES_DIR -type f -name '*.md' -exec ls {} + | fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down)
    if [[ ! -z "$notefile" ]]
    then
        nvim $notefile
    fi
}

while getopts ":th" options; do
    case $options in
        t) # search on tags
            search_by_tag
            exit;;
        h) # display Help
            help
            exit;;
        \?) # invalid option
            echo "Error: Invalid option"
            exit;;
    esac
done

search_by_filename
