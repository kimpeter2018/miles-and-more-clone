import 'package:arc_progress_bar/arc_progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';
import 'package:miles_and_more_clone/features/card/widgets/benefit_info_link_card.dart';

class QualificationPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<QualificationPage> createState() => _QualificationPageState();
}

class _QualificationPageState extends ConsumerState<QualificationPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).value;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Text(
              "Qualification to Frequent Traveller",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ArcProgressBar(
                      percentage: (user?.points != null)
                          ? (user!.points / 650) * 100
                          : 0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      handleSize: 0,
                      arcThickness: 7,
                      innerPadding: 20,
                      strokeCap: StrokeCap.round,
                      bottomCenterWidget: Text(
                        "Points",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      centerWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(user?.points != null) ? user!.points : 0}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "650",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ArcProgressBar(
                      innerPadding: 20,
                      percentage: (user?.qualifyingPoints != null)
                          ? (user!.qualifyingPoints / 325) * 100
                          : 0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      handleSize: 0,
                      arcThickness: 7,
                      strokeCap: StrokeCap.round,
                      bottomCenterWidget: Text(
                        "Qualifying Points",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      centerWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(user?.qualifyingPoints != null) ? user!.qualifyingPoints : 0}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "325",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.primary,
              child: Text(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  "You still require ${650 - user!.points} points and ${325 - user!.qualifyingPoints} Qualifying Points this calendar year to achieve Frequent Traveller status. Please note that only a maximum of 160 Qualifying Points earned on train journeys can be counted towards achieving status."),
            ),
            const SizedBox(height: 16),
            const BenefitInfoLinkCard(),
          ],
        ),
      ),
    );
  }
}
