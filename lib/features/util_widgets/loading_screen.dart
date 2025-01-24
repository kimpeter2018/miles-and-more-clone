import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const String routeName = '/loading-screen';

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
