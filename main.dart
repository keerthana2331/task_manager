import 'dart:io';
import 'taskmanager.dart';

void main() {
  TaskManager taskManager = TaskManager();
  bool isRunning = true;

  print('Welcome to Task Manager');

  while (isRunning) {
    print('\nChoose an option:');
    print('1. Add a task');
    print('2. View tasks');
    print('3. Update a task');
    print('4. Delete a task');
    print('5. Mark a task as complete');
    print('6. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addTask(taskManager);
        break;
      case '2':
        taskManager.readTask(); // Correct method call
        break;
      case '3':
        updateTask(taskManager);
        break;
      case '4':
        deleteTask(taskManager);
        break;
      case '5':
        completeTask(taskManager);
        break;
      case '6':
        isRunning = false;
        print('Exiting Task Manager. Goodbye!');
        break;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

// Function to handle adding a new task
void addTask(TaskManager taskManager) {
  print('Enter task title:');
  String? title = stdin.readLineSync();
  print('Enter task description:');
  String? description = stdin.readLineSync();

  if (title != null && title.isNotEmpty && description != null && description.isNotEmpty) {
    taskManager.createTasks(title, description);
  } else {
    print('Invalid input. Task not added.');
  }
}

// Function to handle updating an existing task
void updateTask(TaskManager taskManager) {
  print('Enter task ID to update:');
  String? input = stdin.readLineSync();
  int? id = int.tryParse(input ?? '');

  if (id != null) {
    print('Enter new task title:');
    String? newTitle = stdin.readLineSync();
    print('Enter new task description:');
    String? newDescription = stdin.readLineSync();

    if (newTitle != null && newTitle.isNotEmpty && newDescription != null && newDescription.isNotEmpty) {
      taskManager.updateTask(id, newTitle, newDescription);
    } else {
      print('Invalid input. Task not updated.');
    }
  } else {
    print('Invalid task ID.');
  }
}

// Function to handle deleting a task
void deleteTask(TaskManager taskManager) {
  print('Enter task ID to delete:');
  String? input = stdin.readLineSync();
  int? id = int.tryParse(input ?? '');

  if (id != null) {
    taskManager.deleteTask(id);
  } else {
    print('Invalid task ID.');
  }
}

// Function to handle marking a task as complete
void completeTask(TaskManager taskManager) {
  print('Enter task ID to mark as complete:');
  String? input = stdin.readLineSync();
  int? id = int.tryParse(input ?? '');

  if (id != null) {
    taskManager.completeTask(id);
  } else {
    print('Invalid task ID.');
  }
}
