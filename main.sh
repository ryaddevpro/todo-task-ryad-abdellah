#!/bin/bash

source ./add.sh
source ./delete.sh
source ./get.sh

# Function to print usage information
Help() {
    echo "This is a task manager that performs CRUD operations."
    echo "To use it, you need to adopt a certain structure."
    echo "Usage:"
    echo "-a: to add a new task example: ./main.sh --title='task 1' --description='this is a description of the task' --finishDate='dd-mm-yyyy hh:mm'"
    echo "-id (taskId) example: -id 2"
    echo "-title to search for a task based on his title example: ./main -title "task 1""
    echo "-delete delete a task by it s id example: ./main.sh -delete 1"
}

# Main script starts here
if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    Help
fi

if [ "$1" == "-a" ]; then
    addTask "$@"
fi

if [ "$1" == "-id" ]; then
    getTaskById "$2"
fi

if [ "$1" == "-tasks" ]; then
    getAllTask
fi

if [ "$1" == "-title" ]; then
    searchForTitle "$2"
fi

if [ "$1" == "-delete" ]; then
    deleteTaskById "$2"
fi