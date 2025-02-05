import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/points/points_history_model.dart';

final firestoreServiceProvider = Provider((ref) => UserRepository());

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPointsSubcollection({
    required String userId,
    required int points,
    required String provider,
    required String type,
    required String title,
    required String detail,
  }) async {
    PointHistoryModel pointsHistoryModel = PointHistoryModel(
      points: points,
      provider: provider,
      type: type,
      date: DateTime.timestamp(),
      title: title,
      detail: detail,
    );
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('pointsHistory')
          .add(pointsHistoryModel.toJson());

      switch (type) {
        case 'miles':
          await _firestore.collection('users').doc(userId).update({
            'miles': FieldValue.increment(points),
          });
          break;
        case 'points':
          await _firestore.collection('users').doc(userId).update({
            'points': FieldValue.increment(points),
          });
          break;
        case 'qualifyingPoints':
          await _firestore.collection('users').doc(userId).update({
            'qualifyingPoints': FieldValue.increment(points),
          });
          break;
        default:
      }
    } catch (e) {
      print("Error adding document: $e");
      rethrow;
    }
  }
}
