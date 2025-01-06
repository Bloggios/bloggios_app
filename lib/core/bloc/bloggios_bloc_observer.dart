/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: bloggios_bloc_observer
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloggiosBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    debugPrint('On Create: ${bloc.runtimeType}');
  }
}