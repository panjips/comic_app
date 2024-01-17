import 'package:comic_app/presentation/routes/builder_page.dart';
import 'package:comic_app/presentation/screen/app_scaffold.dart';
import 'package:comic_app/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: "/home",
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return AppScaffold(
              child: child,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: "/home",
              name: "home",
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const HomeScreen(),
              ),
            ),
          ],
        )
      ]);

  static GoRouter get router => _router;
}
