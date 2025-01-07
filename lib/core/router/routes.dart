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
}