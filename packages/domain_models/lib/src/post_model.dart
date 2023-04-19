class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel._internal({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel._internal(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
