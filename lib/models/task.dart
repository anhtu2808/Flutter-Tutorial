enum Priority { low, medium, high }

class Task {
  int id;
  String title;
  String? description;
  String? location;
  DateTime? dueDate;
  Priority priority;
  bool isDone;
  String? category;

  Task({
    required this.id,
    required this.title,
    this.description,
    this.location,
    this.dueDate,
    this.priority = Priority.medium,
    this.isDone = false,
    this.category,
  });
}
