import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  void main() {
    runApp(
      // For widgets to be able to read providers, we need to wrap the entire
      // application in a "ProviderScope" widget.
      // This is where the state of our providers will be stored.
      const ProviderScope(
        child: MyApp(),
      ),
    );
}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Firebase Setup')),
        body: const Center(child: Text('Firebase Initialized!')),
      ),
    );
  }
}
