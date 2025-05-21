class Todo {
  int id;
  String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  // Convert a Todo object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  // Create a Todo object from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
