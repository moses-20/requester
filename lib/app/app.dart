import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_repository/post_repository.dart';
import 'package:requester/modules/n10n/nav_page.dart';

class PostApp extends StatelessWidget {
  const PostApp({
    super.key,
    required this.router,
    required this.postRepository,
  });

  final GoRouter router;
  final PostRepository postRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: postRepository,
      child: const PostAppView(),
    );
  }
}

class PostAppView extends StatelessWidget {
  const PostAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
