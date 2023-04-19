import 'package:go_router/go_router.dart';
import 'package:requester/error/error.dart';
import 'package:requester/home/home.dart';

import 'nav_base.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: N10N.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/${N10N.error}',
      name: N10N.error,
      builder: (context, state) {
        return ErrorPage(
          title: state.queryParams['title']!,
          message: state.queryParams['message']!,
        );
      },
    ),
  ],
);
