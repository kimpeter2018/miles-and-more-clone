import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miles_and_more_clone/data_models/news/news_model.dart';

class NewsRepository {
  final FirebaseFirestore _firestore;

  NewsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<News>> fetchNews() async {
    try {
      final snapshot = await _firestore.collection('news').get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Parse MilesType
        final milesType = MilesType.values.firstWhere(
          (e) => e.value == data['milesType'],
          orElse: () =>
              throw Exception('Invalid milesType: ${data['milesType']}'),
        );
        return News.fromJson({...data, 'milesType': milesType.name});
      }).toList();
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
