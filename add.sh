#!/bin/bash

getValueOfArgument() {
    local key="$1"
    shift
    echo "$@" | grep -oP "(?<=--$key=).*?(?=(\s--|$))"
}

getValueOfArgumentFromFile() {
    local key="$1"
    shift
    local value=$(echo "$@" | grep -oP "(?<=$key=).*?(?=(\s--|$))")
    IFS='|' read -ra values <<<"$value"
    echo "${values[0]}"
}

# Check datetime validity
checkDatetime() {
    local datetime="$1"
    # Extract day, month, year, hour, and minute
    IFS=' /:-' read -r -a datetime_parts <<<"$datetime"
    day=${datetime_parts[0]}
    month=${datetime_parts[1]}
    year=${datetime_parts[2]}
    hour=${datetime_parts[3]}
    minute=${datetime_parts[4]}

    if ((10#$day < 1 || 10#$day > 31)); then
        echo "Error: Invalid day. Day must be between 01 and 31."
        return 1
    elif ((10#$month < 1 || 10#$month > 12)); then
        echo "Error: Invalid month. Month must be between 01 and 12."
        return 1

    elif ((10#$hour < 0 || 10#$hour > 23)); then
        echo "Error: Invalid hour. Hour must be between 00 and 23."
        return 1
    elif ((10#$minute < 0 || 10#$minute > 59)); then
        echo "Error: Invalid minute. Minute must be between 00 and 59."
        return 1
    elif [[ ! "$datetime" =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}\ [0-9]{2}:[0-9]{2}$ ]]; then
        echo "Error: Invalid datetime format. Please use DD/MM/YYYY HH:MM."
        return 1
    fi
}

Help() {
    echo "This is a task manager that performs CRUD operations."
    echo "To use it, you need to adopt a certain structure."
    echo "Usage:"
    echo "-a: to add a new task example: ./main.sh --title='task 1' --description='this is a description of the task' --finishDate='dd-mm-yyyy hh:mm'"
}

addTask() {
    numberOfLine=$(grep -c . file.txt)
    title=$(getValueOfArgument "title" "$@")
    description=$(getValueOfArgument "description" "$@")
    finishDateTime=$(getValueOfArgument "finishDate" "$@")

    # Check validity of due datetime
    if ! checkDatetime "$finishDateTime"; then
        exit 1
    fi

    echo "id= $numberOfLine | title= $title | description= $description | finishDate= $finishDateTime | isCompleted= 1" >>file.txt
}
