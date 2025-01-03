/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: router.dart
 */

import 'package:bloggios_app/core/models/routes.dart';
import 'package:bloggios_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:bloggios_app/features/onboarding/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

GoRouter initRouter(String initialRoute) {
  return GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
        path: Routes.splash.path,
        name: Routes.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.onboarding.path,
        name: Routes.onboarding.name,
        builder: (context, state) => const OnboardingPage(),
      )
    ],
  );
}
