import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:post_api/post_api.dart';
import 'package:post_repository/post_repository.dart';
import 'package:requester/modules/n10n/nav_page.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final PostApi postApi = PostApiRemote();

  bootstrap(postApi: postApi);
}

void bootstrap({required PostApi postApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final postRepository = PostRepository(postApi: postApi);

  runZonedGuarded(
    () => runApp(PostApp(router: router, postRepository: postRepository)),
    (error, stack) => log(error.toString(), stackTrace: stack),
  );
}
