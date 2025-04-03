import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salawat_app/core/resources/app_routes.dart';
import 'package:salawat_app/features/home/presentation/views/home_view.dart';
import 'package:salawat_app/features/home/presentation/views/onboreading_view.dart';

const String homeViewPath = '/homeView';
const String onBoreading1Path = '/onBoreading1';
const String onBoreading2Path = '/onBoreading2';
const String onBoreading3Path = '/onBoreading3';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: homeViewPath,
    routes: [
      GoRoute(
        path: homeViewPath,
        name: AppRoutes.homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: onBoreading1Path,
        name: AppRoutes.onBoreading1Route,
        builder: (context, state) => const OnboreadingView(),
      ),
      GoRoute(
        path: onBoreading2Path,
        name: AppRoutes.onBoreading2Route,
        builder: (context, state) => const OnboreadingView2(),
      ),
      GoRoute(
        path: onBoreading3Path,
        name: AppRoutes.onBoreading3Route,
        builder: (context, state) => const OnboreadingView3(),
      ),
    ],
    errorPageBuilder:
        (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('Page not found'))),
        ),
  );
}
