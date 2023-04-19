import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_repository/post_repository.dart';
import 'package:requester/home/bloc/home_bloc.dart';
import 'package:requester/modules/n10n/nav_base.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        postRepository: context.read<PostRepository>(),
      )..add(const PostSubscriptionRequested()),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts App'),
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) => current.status != previous.status,
        listener: (context, state) {
          if (state.status == HomeStateStatus.failed) {
            context.goNamed(N10N.error, queryParams: {
              'title': state.errorTitle,
              'message': state.errorMessage,
            });
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ListView(
              children: [
                for (final post in state.posts)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      tileColor: Colors.transparent,
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
