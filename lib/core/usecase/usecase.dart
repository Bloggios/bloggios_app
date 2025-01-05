/*
  Developer: Rohit Parihar
  Project: bloggios_mobile
  GitHub: github.com/rohit-zip
  File: usecase.dart
 */

import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<A, B> {
  Future<Either<BloggiosException, A>> call(B params);
}
