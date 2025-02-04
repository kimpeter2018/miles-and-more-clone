import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';

class LifetimePage extends ConsumerWidget {
  const LifetimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Status of my qualifications as:",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              const Text(
                "Frequent Traveller Lifetime:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "0",
                style: TextStyle(fontSize: 24),
              ),
              const Text("Qualifying Points"),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: (user!.qualifyingPoints / 30000),
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(8),
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Text(
                    "Keep earning: you still need ${30000 - user.qualifyingPoints} Qualifying Points to become a Frequent Traveller Lifetime."),
              ),
              const SizedBox(height: 48),
              Text(
                'My achievements',
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
      ),
    );
  }
}
