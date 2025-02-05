import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:miles_and_more_clone/features/account/account_page.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:miles_and_more_clone/features/auth/screens/welcome_screen.dart';
import 'package:miles_and_more_clone/features/card/pages/cards_page.dart';
import 'package:miles_and_more_clone/features/news/pages/news_page.dart';
import 'package:miles_and_more_clone/points_test_page.dart';

class RootLayout extends ConsumerStatefulWidget {
  static const String routeName = '/';
  const RootLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends ConsumerState<RootLayout> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      NewsPage(
        onTabChanged: _onTabTapped,
      ),
      const AccountPage(),
      const PointsEntryPage(),
      const CardsPage(),
      const MorePage(),
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Awards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

//TODO: make separate pages

class AwardsPage extends StatelessWidget {
  const AwardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Awards Page'));
  }
}

class MorePage extends ConsumerWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: ElevatedButton(
            child: const Text('Log out'),
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
              Navigator.of(context).popUntil(
                  (route) => route.settings.name == WelcomeScreen.routeName);
            }));
  }
}
