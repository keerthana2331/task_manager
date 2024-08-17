
import 'task.dart';

class TaskManager {
  List<Task> Tasks = [];
  int _currentId = 1;

  void createTasks(String title, String description) {
    Tasks.add(Task(_currentId++, title, description));
    print('Tasks added: $title');
      
  }

  void readTask() {
  
    final a= '5.2';
    int num =5;
    
    if (Tasks.isEmpty) {
      print('No task available.');
    } else {
      for (var task in Tasks) {
        print(task);
      }
    }
  }

  void updateTask(int id, String newTitle, String newDescription) {
    for (var task in Tasks) {
      if (task.id == id) {
        task.update(newTitle, newDescription);
        print('Task updated: $newTitle');
        return;
      }
    }
    print('Task not found.');
  }

  void deleteTask(int id) {
    Tasks.removeWhere((task) => task == id);
    print('Task deleted.');
  }

  void completeTask(int id) {
    for (var task in Tasks) {
      if (task.id == id) {
        task.complete();
        print('Task marked as complete.');
        return;
      }
    }
    print('Task not found.');
  }
}

