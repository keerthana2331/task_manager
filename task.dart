


class Task {
  int id;
  String title;
  String description;
  bool isCompleted;

  Task(this.id, this.title, this.description) : isCompleted = false;

  void update(String newTitle, String newDescription) {
    title = newTitle;
    description = newDescription;
  }

  void complete() {
    isCompleted = true;
  }

  @override
  String toString() {
    return '${isCompleted ? "[x]" : "[ ]"} $title: $description (ID: $id)';
  }
}

