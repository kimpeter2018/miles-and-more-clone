import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/user/user_provider.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';
import 'news_controller.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  bool _isChallengeExpanded = false;
  String? _selectedMilesType;

  @override
  Widget build(BuildContext context) {
    final newsState = ref.watch(newsProvider);
    final user = ref.watch(userProvider).value;

    return Scaffold(
      body: RefreshIndicator(
        edgeOffset: 300,
        onRefresh: () async {
          ref.refresh(newsProvider.notifier).fetchNews();
          ref.invalidate(userProvider);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 200.0,
              title: const Text('Miles & More'),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            margin: const EdgeInsets.only(left: 8),
                            elevation: 1,
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(minHeight: 90),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user?.miles} M',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Miles',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            elevation: 1,
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(minHeight: 90),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${user?.qualifyingPoints}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Qualifying Points',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${user?.points}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Points',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      color: Colors.grey[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Challenge',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 8),
                      _buildFilterChip('Earn'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Spend'),
                    ],
                  ),
                ],
              ),
            ),
            newsState.when(
              data: (newsList) {
                final filteredNews = _selectedMilesType == null
                    ? newsList
                    : newsList
                        .where((news) => news.milesType == _selectedMilesType)
                        .toList();
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final news = filteredNews[index];
                      return Card(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        color: Theme.of(context).colorScheme.onPrimary,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (news.photoUrl != null)
                                ? ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.zero),
                                    child: Image.network(
                                      news.photoUrl!,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.zero),
                                    child: Image.asset(
                                      'assets/images/default_news.jpg',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            if (news.logoUrl != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8.0),
                                child: Image.network(
                                  news.logoUrl!,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8.0),
                              child: Text(
                                news.milesType,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8.0),
                              child: Text(
                                news.description,
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      );
                    },
                    childCount: filteredNews.length,
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => SliverToBoxAdapter(
                child: Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String milesType) {
    return ChoiceChip(
      label: Text('$milesType Miles'),
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: _selectedMilesType == milesType
              ? Theme.of(context).colorScheme.primary
              : Colors.grey,
        ),
      ),
      selected: _selectedMilesType == milesType,
      onSelected: (isSelected) {
        setState(() {
          _selectedMilesType = isSelected ? milesType : null;
        });
      },
    );
  }
}
