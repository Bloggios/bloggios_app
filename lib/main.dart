import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/router/router.dart';
import 'package:bloggios_app/core/theme/theme.dart';
import 'package:bloggios_app/core/utils/init_app.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/register_otp_bloc.dart';
import 'package:bloggios_app/features/authentication/view/bloc/user_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {

  await initApp();

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
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        routerConfig: initRouter(),
      ),
    );
  }
}
