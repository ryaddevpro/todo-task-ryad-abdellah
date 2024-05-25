# Task Manager

This project is a simple task manager that performs CRUD (Create, Read, Update, Delete) operations on tasks. The tasks are stored in a text file (`file.txt`) and manipulated using Bash scripts.

## Design Choices

### Data Storage
Tasks are stored in a plain text file called `file.txt`. Each task is represented as a single line in the following format:



- **id**: Unique identifier for each task.
- **title**: Title of the task.
- **description**: Description of the task.
- **finishDate**: Due date and time for the task.
- **isCompleted**: Status of the task (1 for incomplete, 0 for complete).

### Code Organization
The project is organized into several Bash scripts:

- `main.sh`: Main script to run the task manager.
- `add.sh`: Script containing the function to add a new task.
- `delete.sh`: Script containing the function to delete a task by ID.
- `get.sh`: Script containing functions to get tasks by ID, get all tasks, and search tasks by title.

## Usage

### Adding a Task
To add a new task, use the `-a` option followed by the task details:
```bash
./main.sh -a --title='Task 1' --description='This is a description of the task' --finishDate='13/03/2024 23:30'
