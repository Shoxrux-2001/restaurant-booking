import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_booking/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await _authService.logOutUser();
                context.go(
                  '/onboarding',
                ); 
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logout failed: ${e.toString()}')),
                );
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to Home Screen!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
