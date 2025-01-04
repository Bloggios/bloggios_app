/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: secured_storage
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/constants/storage_constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredStorage {
  static final FlutterSecureStorage _secureStorage =
      serviceLocator<FlutterSecureStorage>();

  static Future<void> storeIsOnboardingVisited() async {
    try {
      await _secureStorage.write(key: StorageConstants.isOnboardingVisited, value: "true");
    } catch (e) {
      debugPrint('Error storing user visit status: $e');
    }
  }

  static Future<String?> retrieveIsOnboardingVisited() async {
    return await _secureStorage.read(key: StorageConstants.isOnboardingVisited);
  }
}
