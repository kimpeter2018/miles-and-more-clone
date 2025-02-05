import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:miles_and_more_clone/data_models/points/points_history_model.dart';
import 'package:miles_and_more_clone/data_models/user/user_repository.dart';
import 'package:miles_and_more_clone/features/account/account_controller.dart';
import 'package:miles_and_more_clone/features/auth/auth_controller.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  List<PointHistoryModel> _filterHistory(List<PointHistoryModel> historyList) {
    if (_searchQuery.isEmpty) return historyList;
    return historyList.where((entry) {
      return entry.provider
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          entry.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          entry.detail.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          entry.type.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          entry.points.toString().contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authControllerProvider).value;

    final pointsHistory = ref.watch(accountProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            pinned: false,
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Theme.of(context).colorScheme.onPrimary,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 48),
                            Text('${user?.miles}M',
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                            const Text('Miles', style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Points'),
                                    Text('${user?.points}')
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Qualifying Points'),
                                    Text('${user?.qualifyingPoints}')
                                  ],
                                ),
                                const Divider(),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('HON Circle Points'),
                                    Text('0')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          pointsHistory.when(
            data: (historyList) {
              final filteredList = _filterHistory(historyList);
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 0) {
                      return _isSearching
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: _searchController,
                                    onChanged: (value) {
                                      setState(() {
                                        _searchQuery = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          "Search for partners, flights...",
                                      prefixIcon: const Icon(Icons.search),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: _toggleSearch,
                                      ),
                                      border: const UnderlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text("${filteredList.length} entries",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text('Activity',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ),
                                IconButton(
                                  onPressed: _toggleSearch,
                                  icon: const Icon(Icons.search),
                                ),
                              ],
                            );
                    }
                    if (index == filteredList.length + 1) {
                      return Center(
                        child: Container(
                          height: 300,
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.only(bottom: 64.0),
                          child: const Text("All entries loaded",
                              style: TextStyle(color: Colors.black)),
                        ),
                      );
                    }
                    return _buildListItem(filteredList[index - 1]);
                  },
                  childCount: filteredList.length + 2,
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(child: Text('Error loading history: $error')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(PointHistoryModel history) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(history.date);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(history.provider,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(formattedDate, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 4),
          Text(history.title),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(history.type),
              Text("${history.points}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
