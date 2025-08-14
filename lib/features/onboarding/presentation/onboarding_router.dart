import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

final onboardingRoutes = [
  GoRoute(
    path: '/onboarding',
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: const OnboardingScreen(),
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
          child: child,
        );
      },
    ),
  ),
];