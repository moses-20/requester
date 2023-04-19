import 'package:domain_models/domain_models.dart';

abstract class PostApi {
  Future<List<PostModel>> fetchAllPosts();
}
