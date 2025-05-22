class Post {
  int id;
  String title;
  String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  // Convert a Todo object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  // Create a Todo object from a JSON map
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
