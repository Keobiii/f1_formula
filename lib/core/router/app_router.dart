import 'package:f1/features/home/app_main_screen.dart';
import 'package:f1/features/home/home_page.dart';
import 'package:f1/features/news/news_page.dart';
import 'package:f1/features/rank/rank_page.dart';
import 'package:f1/features/teams/teams_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/onboarding',
  redirect: (context, state) {},

  routes: [
    GoRoute(path: '/onboarding', builder: (context, state) => const HomePage()),

    ShellRoute(
      builder: (context, state, child) {
        return AppMainScreen(child: child);
      },

      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => fadeTransition(HomePage(), state),
        ),

        GoRoute(
          path: '/news',
          name: 'news',
          pageBuilder: (context, state) => fadeTransition(NewsPage(), state),
        ),

        GoRoute(
          path: '/rank',
          name: 'rank',
          pageBuilder: (context, state) => fadeTransition(RankPage(), state),
        ),

        GoRoute(
          path: '/teams',
          name: 'teams',
          pageBuilder: (context, state) => fadeTransition(TeamsPage(), state),
        ),
      ],
    ),
  ],
);

CustomTransitionPage fadeTransition(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
