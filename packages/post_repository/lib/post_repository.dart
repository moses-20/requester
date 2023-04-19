library post_repository;

import 'package:domain_models/domain_models.dart';
import 'package:post_api/post_api.dart';

enum FetchPolicy {
  networkOnly,
  cacheAndNetwork,
  networkPreferably,
  cachePreferably,
}

class PostRepository {
  final PostApi postApi;

  PostRepository({required this.postApi});

  Stream<List<PostModel>> getAllPosts({
    fetchPolicy = FetchPolicy.networkOnly,
  }) async* {
    // TODO: implement according to fetch policy

    try {
      yield await _fetchPostsFromNetwork();
    } on PostApiFetchPostsException catch (e) {
      throw FetchPostsException(title: e.title, message: e.message);
    } catch (e) {
      // TODO: implement general exception handler
      print('$e');
    }
  }

  Future<List<PostModel>> _fetchPostsFromNetwork() async {
    return await postApi.fetchAllPosts();
  }
}
