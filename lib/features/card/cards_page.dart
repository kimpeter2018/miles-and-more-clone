import 'package:arc_progress_bar/arc_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';
import 'package:miles_and_more_clone/features/card/widgets/wallet_overlay.dart';

class CardsPage extends ConsumerStatefulWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends ConsumerState<CardsPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.9);

  void _openOverlayPage(BuildContext context) {
    Navigator.of(context).push(_createOverlayRoute());
  }

  Route _createOverlayRoute() {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const WalletOverlay(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).value;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/Lufthansa_Logo.png',
                    height: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: screenHeight / 2.5,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: const RoundedRectangleBorder(),
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      handleSize: 0,
                                      arcThickness: 7,
                                      innerPadding: 20,
                                      strokeCap: StrokeCap.round,
                                      bottomCenterWidget: Text(
                                        "Points",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      centerWidget: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${(user?.points != null) ? user!.points : 0}",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "650",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
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
                                      percentage: (user?.qualifyingPoints !=
                                              null)
                                          ? (user!.qualifyingPoints / 325) * 100
                                          : 0,
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      handleSize: 0,
                                      arcThickness: 7,
                                      strokeCap: StrokeCap.round,
                                      bottomCenterWidget: Text(
                                        "Qualifying Points",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      centerWidget: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${(user?.qualifyingPoints != null) ? user!.qualifyingPoints : 0}",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "325",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 55),
                            const Divider(),
                            Text(
                              "ⓘ More Details",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.only(left: 8, bottom: 16),
                      shape: const RoundedRectangleBorder(),
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: SizedBox(
                        child: Padding(
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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "0",
                                style: TextStyle(fontSize: 24),
                              ),
                              const Text("Qualifying Points"),
                              const SizedBox(height: 16),
                              LinearProgressIndicator(
                                value: 0.1,
                                minHeight: 10,
                                backgroundColor: Colors.grey[300],
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary),
                              ),
                              const SizedBox(height: 87),
                              const Divider(),
                              const Text("ⓘ More Details"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                color: Theme.of(context).colorScheme.onPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.zero),
                      child: Image.asset(
                        'assets/images/lounge.jpg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8.0),
                      child: Text(
                        "Become a Frequent Traveller, and enjoy all the benefits",
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _openOverlayPage(context),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Serial Number",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "My Servicecard",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/example_qr_code.jpg', // Replace with your QR code asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
