import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidePageTransition extends CustomTransitionPage {
  SlidePageTransition({required Widget child, LocalKey? key})
    : super(
        key: key,
        child: child,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
}
