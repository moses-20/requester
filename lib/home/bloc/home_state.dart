part of 'home_bloc.dart';

enum HomeStateStatus {
  initial,
  loading,
  success,
  failed,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<PostModel> posts;
  final String? errorTitle;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStateStatus.initial,
    this.posts = const [],
    this.errorTitle,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, posts, errorTitle, errorMessage];

  HomeState copyWith({
    HomeStateStatus? status,
    List<PostModel>? posts,
    String? errorTitle,
    String? errorMessage,
  }) {

    return HomeState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorTitle: errorTitle ?? this.errorTitle,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
