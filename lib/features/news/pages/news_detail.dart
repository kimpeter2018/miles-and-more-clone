import 'package:flutter/material.dart';
import 'package:miles_and_more_clone/data_models/news/news_model.dart';

class NewsDetailPage extends StatefulWidget {
  final News news;

  const NewsDetailPage({super.key, required this.news});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _showTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        (widget.news.photoUrl != null)
                            ? Image.network(widget.news.photoUrl!,
                                width: double.infinity, fit: BoxFit.cover)
                            : Image.asset('assets/images/default_news.jpg',
                                width: double.infinity, fit: BoxFit.cover),
                        Positioned(
                          top: 40,
                          left: 16,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                    if (widget.news.logoUrl != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(widget.news.logoUrl!,
                            height: 60, width: 60),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(widget.news.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(widget.news.description,
                          style: const TextStyle(fontSize: 14)),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text("Terms and Conditions"),
                      trailing: Icon(_showTerms ? Icons.close : Icons.add),
                      onTap: () {
                        setState(() {
                          _showTerms = !_showTerms;
                        });
                      },
                    ),
                    if (_showTerms)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(widget.news.description),
                      ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: FilledButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                ),
                onPressed: () {},
                child: const Text("Continue"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
