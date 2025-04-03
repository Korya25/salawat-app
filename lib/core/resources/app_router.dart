import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salawat_app/core/resources/app_routes.dart';
import 'package:salawat_app/features/home/presentation/views/home_view.dart';
import 'package:salawat_app/features/onboarding/presentation/views/onboarding_view.dart';

const String homeViewPath = '/homeView';
const String onBoreadingPath = '/onBoreading';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: onBoreadingPath,
    routes: [
      GoRoute(
        path: homeViewPath,
        name: AppRoutes.homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: onBoreadingPath,
        name: AppRoutes.onBoreadingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
    errorPageBuilder:
        (context, state) => const MaterialPage(
          child: Scaffold(body: Center(child: Text('Page not found'))),
        ),
  );
}
