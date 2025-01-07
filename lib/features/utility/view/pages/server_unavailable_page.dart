/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: server_unavailable_page
 */

import 'package:bloggios_app/core/router/routes.dart';
import 'package:flutter/material.dart';

class ServerUnavailablePage extends StatelessWidget {
  const ServerUnavailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Routes.serverUnavailable.path,
        ),
      ),
    );
  }
}
