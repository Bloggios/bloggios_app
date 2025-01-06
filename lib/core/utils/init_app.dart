/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: init_app
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/bloc/bloggios_bloc_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  await initDependencies();
  Bloc.observer = BloggiosBlocObserver();
  //await serviceLocator<FlutterSecureStorage>().deleteAll();
  final data = await serviceLocator<FlutterSecureStorage>().readAll();
  debugPrint(data.toString());
}