/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: splash_page
 */

import 'package:bloggios_app/core/models/routes.dart';
import 'package:bloggios_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _colorController;
  late Animation<double> _zoomAnimation;
  late AnimationController _textAnimationController;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _textScaleAnimation;
  bool _isRotationComplete = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 400)
            .chain(CurveTween(curve: Curves.fastOutSlowIn)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 400, end: 320)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 17,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 320, end: 360)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 360, end: 360)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 4,
      ),
    ]).animate(_controller);

    _colorController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _zoomAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _colorController,
        curve: Curves.linear,
      ),
    );

    _textAnimationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 2), // Start 160px below
      end: Offset(0, 0), // End at normal position
    ).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.linear,
      ),
    );

    _textScaleAnimation = Tween<double>(begin: 0.4, end: 1).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.linear,
      ),
    );

    _controller.forward().whenComplete(() {
      setState(() {
        _isRotationComplete = true;
      });
      _colorController
          .forward();
      _textAnimationController.forward();
    });

    _colorController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_textAnimationController.isCompleted) {
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              context.pushReplacement(Routes.onboarding.path);
            }
          });
        }
      }
    });

    _textAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_colorController.isCompleted) {
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) {
              context.pushReplacement(Routes.onboarding.path);
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _isRotationComplete ? _colorController : _animation,
          builder: (context, child) {
            if (_isRotationComplete) {
              return Stack(
                children: [
                  AnimatedBuilder(
                    animation: _colorController,
                    builder: (context, child) {
                      return Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 0),
                            width: _colorController.value *
                                MediaQuery.of(context).size.width,
                            height: _colorController.value *
                                MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    1000 - (_colorController.value * 1000)),
                              ),
                              color: AppPallete.accentColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ScaleTransition(
                          scale: _zoomAnimation,
                          child: Image.asset(
                            'assets/images/bloggios_logo_white.png',
                            width: 140,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SlideTransition(
                          position: _textSlideAnimation,
                          child: ScaleTransition(
                            scale: _textScaleAnimation,
                            child: Text(
                              'BLOGGIOS',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontFamily: 'nunito',
                                  letterSpacing: 1,
                                  overflow: TextOverflow.fade),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            } else {
              return Transform.rotate(
                angle: _animation.value * (3.14159265359 / 180),
                child: Image.asset(
                  'assets/images/bloggios_logo_square-250.png',
                  width: 140,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
