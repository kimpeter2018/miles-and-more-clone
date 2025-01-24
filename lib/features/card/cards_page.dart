import 'package:arc_progress_bar/arc_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardsPage extends ConsumerStatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends ConsumerState<CardsPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/Lufthansa_Logo.png',
              height: 20,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                _buildFirstCard(),
                _buildSecondCard(),
              ],
            ),
          ),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildFirstCard() {
    return Card(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Qualification to Frequent Traveller"),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ArcProgressBar(
                      percentage: 50,
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
                            "0",
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
                      percentage: 50,
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
                            "0",
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
              ],
            ),
            const Divider(),
            const Text("(i) More Details"),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            value: 0.0,
            minHeight: 10,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const Divider(),
          const Text("(i) More Details"),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}
