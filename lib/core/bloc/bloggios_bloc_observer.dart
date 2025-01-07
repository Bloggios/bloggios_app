/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: bloggios_bloc_observer
 */

import 'package:bloggios_app/core/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloggiosBlocObserver extends BlocObserver {

  final router = initRouter();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    debugPrint('On Create: ${bloc.runtimeType}');
  }
}