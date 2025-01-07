/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: get_started_button
 */

import 'package:bloggios_app/core/beans/init_dependencies.dart';
import 'package:bloggios_app/core/router/routes.dart';
import 'package:bloggios_app/core/storage/secured_storage.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:bloggios_app/features/authentication/view/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;
  final authBloc = serviceLocator<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _positionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void onPressed() {
      SecuredStorage.storeIsOnboardingVisited();
      final authState = authBloc.state;
      if (authState is AuthSuccess) {
        context.pushReplacement(Routes.homePage.path);
      } else {
        context.pushReplacement(Routes.authentication.path);
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.accentColor,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        enableFeedback: true
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito'
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_positionAnimation.value * 20, 0),
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}

