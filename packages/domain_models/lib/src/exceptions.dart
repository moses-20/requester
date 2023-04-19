class FetchPostsException implements Exception {
  final String title;
  final String message;

  FetchPostsException({
    required this.title,
    required this.message,
  });
}
