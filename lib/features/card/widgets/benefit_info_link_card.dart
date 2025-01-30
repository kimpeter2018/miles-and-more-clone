import 'package:flutter/material.dart';

class BenefitInfoLinkCard extends StatelessWidget {
  const BenefitInfoLinkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      color: Theme.of(context).colorScheme.onPrimary,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.zero),
            child: Image.asset(
              'assets/images/lounge.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Text(
              "Become a Frequent Traveller, and enjoy all the benefits",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
