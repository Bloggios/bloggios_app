/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: exception_provider
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/exception/bloggios_exception.dart';
import 'package:bloggios_app/core/exception/exception_code_service.dart';
import 'package:bloggios_app/core/models/exception_info.dart';

abstract class ExceptionProvider {

  static ExceptionInfo getInfo(BloggiosException exception) {
    final ExceptionCodeService exceptionCodeService = serviceLocator<ExceptionCodeService>();
    ExceptionInfo? info = exceptionCodeService.getExceptionInfo(exception.code);
    if (info == null) {
      return ExceptionInfo(exception.code, exception.code, exception.message);
    }
    return info;
  }
}