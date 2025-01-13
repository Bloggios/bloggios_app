/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: init_app
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/bloc/bloggios_bloc_observer.dart';
import 'package:bloggios_app/core/dio/init_dio.dart';
import 'package:bloggios_app/core/router/router.dart';
import 'package:bloggios_app/core/utils/app_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

Future<GoRouter> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  await initDependencies();
  AppLogger.init(isProduction: false);
  Bloc.observer = BloggiosBlocObserver();
  //await serviceLocator<FlutterSecureStorage>().deleteAll();
  final data = await serviceLocator<FlutterSecureStorage>().readAll();
  AppLogger.info(data.toString());
  final GoRouter router = initRouter();
  initDio(router);
  return router;
}