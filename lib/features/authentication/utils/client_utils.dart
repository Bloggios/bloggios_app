/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: client_utils
 */

import 'package:bloggios_app/core/constants/env_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ClientDetails {

  static String getClientId() {
    return dotenv.get(EnvConstants.clientId);
  }

  static String getClientSecret() {
    return dotenv.get(EnvConstants.clientSecret);
  }
}