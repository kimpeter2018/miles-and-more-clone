import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/news/news_model.dart';
import 'news_repository.dart';

final newsProvider =
    StateNotifierProvider<NewsController, AsyncValue<List<News>>>((ref) {
  final repository = ref.read(newsRepositoryProvider);
  return NewsController(repository);
});

final newsRepositoryProvider =
    Provider<NewsRepository>((ref) => NewsRepository());

class NewsController extends StateNotifier<AsyncValue<List<News>>> {
  final NewsRepository _repository;

  NewsController(this._repository) : super(const AsyncValue.loading()) {
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final newsList = await _repository.fetchNews();
      state = AsyncValue.data(newsList);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
