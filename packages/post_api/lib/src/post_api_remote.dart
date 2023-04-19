import 'dart:convert';
import 'dart:io';

import 'package:domain_models/domain_models.dart';
import 'package:http/http.dart' as http;
import 'package:post_api/post_api.dart';

class PostApiRemote implements PostApi {
  static final _uri = Uri.https('jsonplaceholder.typicode.com', '/posts');

  @override
  Future<List<PostModel>> fetchAllPosts() async {
    final List<PostModel> posts = [];

    try {
      final response = await http.get(_uri);

      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}', uri: _uri);
      }

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        for (var item in jsonResponse) {
          posts.add(PostModel.fromJson(item));
        }
      }

      return posts;
    } on SocketException catch (_) {
      throw PostApiFetchPostsException(
        title: 'INTERNET CONNECTION',
        message: 'Check your internet and try again',
      );
    } on HttpException catch (e) {
      throw PostApiFetchPostsException(
        title: 'REQUEST ERROR ${e.message}',
        message: 'The request failed for: ${e.uri?.path}',
      );
    } catch (e) {
      print('$e');
      throw PostApiUnkownException(message: '$e');
    }
  }
}
