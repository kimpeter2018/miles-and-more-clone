import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Example sign-in code, replace with your own
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: 'test@example.com',
                password: 'password123',
              );
            } catch (e) {
              print('Login failed: $e');
            }
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}

