/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: init_dependencies
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSecuredStorage();
}

void _initSecuredStorage() {
  serviceLocator.registerLazySingleton(
      () => FlutterSecureStorage(),
  );
}