#!/bin/bash

getValueOfArgumentFromFile() {
    # titleFromFile=$(getValueOfArgumentFromFile "title" "$getId2")
    local key="$1"
    shift
    local value=$(echo "$@" | grep -oP "(?<=$key=).*?(?=(\s--|$))")
    IFS='|' read -ra values <<<"$value"
    echo "${values[0]}"
}
getTaskById() {
    local getId=$(grep -m 1 "id= $1" file.txt)
    if [ -z "$getId" ]; then
        echo "There is no id $1"
    else
        echo "$getId"
    fi
}

getAllTask() {
    cat "file.txt"
}

searchForTitle() {
    while IFS= read -r line; do
        title=$(getValueOfArgumentFromFile "title" "$line")
        search=$(echo "$title" | grep -i "$1")
        if [ ! -z "$search" ]; then

            echo "$line"
        fi
    done <"file.txt"
}
