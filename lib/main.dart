import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/router/router.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDependencies();
  final GoRouter router = initRouter(Routes.splash.path);
  //await serviceLocator<FlutterSecureStorage>().deleteAll();
  final data = await serviceLocator<FlutterSecureStorage>().readAll();
  debugPrint(data.toString());
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
