import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  bool _isChallengeExpanded = false;
  final ScrollController _scrollController = ScrollController();
  double _appBarOpacity = 1.0;

  Future<void> _refreshContent() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();

    // Add a listener to the scroll controller
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      setState(() {
        // Fade away when scrolling down, appear when scrolling up
        _appBarOpacity = (100 - offset.clamp(0, 100)) / 100;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshContent,
        child: Stack(
          children: [
            // Main content (list of news items)
            ListView.builder(
              controller: _scrollController,
              itemCount: 10,
              padding: const EdgeInsets.only(
                  top: 200), // Leave space for the custom app bar
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('News Item ${index + 1}'),
                  subtitle: const Text('Details about this news item.'),
                ),
              ),
            ),

            // Custom floating app bar
            Opacity(
              opacity: _appBarOpacity,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Miles & More',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Mileage Points',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text('12,345'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Qualifying Points',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text('678'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChallengeExpanded = !_isChallengeExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('My Challenge'),
                            Icon(_isChallengeExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    if (_isChallengeExpanded)
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxHeight: 100.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.grey[200],
                        child: const Text('Challenge Details Here'),
                      ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Chip(label: Text('Earn Miles')),
                        SizedBox(width: 8),
                        Chip(label: Text('Spend Miles')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
