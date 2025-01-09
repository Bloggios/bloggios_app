/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: routes
 */

import 'package:bloggios_app/core/models/app_route.dart';

class Routes {
  static AppRoute splash = AppRoute(name: 'splash', path: '/splash');
  static AppRoute onboarding = AppRoute(name: 'onboarding', path: '/onboarding');
  static AppRoute authentication = AppRoute(name: 'authentication', path: '/authentication');
  static AppRoute homePage = AppRoute(name: 'home', path: '/home');
  static AppRoute serverUnavailable = AppRoute(name: 'serverUnavailable', path: '/server-unavailable');
  static AppRoute profileOnboarding = AppRoute(name: 'profileOnboarding', path: '/profile-onboarding');
  static AppRoute applicationPrimaryUsecase = AppRoute(name: 'applicationPrimaryUsecase', path: '/application-primary-usecase');
  static AppRoute matrimonyOnboardingPage = AppRoute(name: 'matrimonyOnboarding', path: '/matrimony-onboarding');
}