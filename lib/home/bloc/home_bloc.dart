import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain_models/domain_models.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostRepository _postRepository;

  HomeBloc({
    required PostRepository postRepository,
  })  : _postRepository = postRepository,
        super(const HomeState()) {
    on<PostSubscriptionRequested>(_onSubscriptionRequested);
  }

  FutureOr<void> _onSubscriptionRequested(
    PostSubscriptionRequested event,
    Emitter<HomeState> emitter,
  ) async {
    emitter(state.copyWith(status: HomeStateStatus.loading));

    await emitter.forEach<List<PostModel>>(
      _postRepository.getAllPosts(),
      onData: (posts) => state.copyWith(
        status: HomeStateStatus.success,
        posts: posts,
      ),
      onError: (error, stack) {
        if (error is FetchPostsException) {
          return state.copyWith(
            status: HomeStateStatus.failed,
            errorTitle: error.title,
            errorMessage: error.message,
          );
        }

        return state.copyWith(
          status: HomeStateStatus.failed,
        );
      },
    );
  }
}
