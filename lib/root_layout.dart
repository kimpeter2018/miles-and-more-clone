import 'package:flutter/material.dart';

class RootLayout extends StatelessWidget {
  static const String routeName = '/';
  const RootLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Root Layout')),
      body: const Center(
        child: Text('Authenticated Area. Use the navigation bar to explore.'),
      ),
    );
  }
}