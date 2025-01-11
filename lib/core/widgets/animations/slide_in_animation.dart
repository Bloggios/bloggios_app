/*
  Developer: Rohit Parihar
  Project: bloggios_app
  GitHub: github.com/rohit-zip
  File: slide_in_transition
 */

import 'package:flutter/material.dart';

class SlideInAnimation extends StatefulWidget {
  final bool isShown;
  final Widget child;

  const SlideInAnimation({
    super.key,
    required this.isShown,
    required this.child,
  });

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SlideInAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isShown && !oldWidget.isShown) {
      _controller.forward();
    } else if (!widget.isShown && oldWidget.isShown) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: widget.isShown
          ? SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      )
          : SizedBox.shrink(),
    );
  }
}
