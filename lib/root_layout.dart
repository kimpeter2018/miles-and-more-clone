import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'package:miles_and_more_clone/features/auth/screens/welcome_screen.dart';
import 'package:miles_and_more_clone/features/card/cards_page.dart';
import 'package:miles_and_more_clone/features/news/news_page.dart';

class RootLayout extends ConsumerStatefulWidget {
  static const String routeName = '/';
  const RootLayout({Key? key}) : super(key: key);

  @override
  ConsumerState<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends ConsumerState<RootLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const NewsPage(),
    const AccountPage(),
    const AwardsPage(),
    const CardsPage(),
    const MorePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
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
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('Account Page'));
  }
}

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
