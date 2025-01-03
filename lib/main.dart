import 'package:bloggios_app/core/models/routes.dart';
import 'package:bloggios_app/core/router/router.dart';
import 'package:bloggios_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final GoRouter router = initRouter(Routes.splash.path);
  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  final GoRouter goRouter;

  const MyApp(
    this.goRouter, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWholeScreen: true,
        child: MaterialApp.router(
          title: 'Bloggios',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          routerConfig: goRouter,
        ),
    );
  }
}
