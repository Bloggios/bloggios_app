import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/bloc/bloggios_bloc_observer.dart';
import 'package:bloggios_app/core/router/router.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/theme/theme.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  await initDependencies();
  Bloc.observer = BloggiosBlocObserver();
  final GoRouter router = initRouter(Routes.splash.path);
  //await serviceLocator<FlutterSecureStorage>().deleteAll();
  final data = await serviceLocator<FlutterSecureStorage>().readAll();
  debugPrint(data.toString());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<UserAuthBloc>(),
        ),
        BlocProvider(create: (_) => serviceLocator<RegisterOtpBloc>())
      ],
      child: MyApp(router),
    ),
  );
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
        disableBackButton: true,
        closeOnBackButton: false,
        child: MaterialApp.router(
          title: 'Bloggios',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          routerConfig: goRouter,
        ),
    );
  }
}
