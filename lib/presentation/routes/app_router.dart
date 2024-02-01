import 'package:comic_app/presentation/routes/builder_page.dart';
import 'package:comic_app/presentation/screen/app_scaffold.dart';
import 'package:comic_app/presentation/screen/detail_comic/detail_comic_screen.dart';
import 'package:comic_app/presentation/screen/explore/explore_screen.dart';
import 'package:comic_app/presentation/screen/home/home_screen.dart';
import 'package:comic_app/presentation/screen/root_scaffold.dart';
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
                routes: [
                  GoRoute(
                      path: "detail",
                      name: "detail",
                      parentNavigatorKey: _rootNavigatorKey,
                      pageBuilder: (context, state) {
                        final url = state.uri.queryParameters['url'];
                        final thumbnail =
                            state.uri.queryParameters['thumbnail'];
                        return buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: RootScaffold(
                            child: DetailComic(
                              thumbnail: thumbnail!,
                              url: url!,
                            ),
                          ),
                        );
                      }),
                ]),
            GoRoute(
              path: "/explore",
              name: "explore",
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const ExploreScreen(),
              ),
            ),
          ],
        )
      ]);

  static GoRouter get router => _router;
}
