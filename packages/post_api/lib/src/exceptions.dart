class PostApiFetchPostsException implements Exception {
  final String title;
  final String message;

  PostApiFetchPostsException({
    required this.title,
    required this.message,
  });
}

class PostApiUnkownException implements Exception {
  final String message;

  PostApiUnkownException({required this.message});
}
