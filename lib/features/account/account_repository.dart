import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/points/points_history_model.dart';

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepository());

class AccountRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore;

  AccountRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<PointHistoryModel>> fetchPointsHistory() async {
    User? user = firebaseAuth.currentUser;
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(user?.uid)
          .collection('pointsHistory')
          .get();

      return querySnapshot.docs
          .map((doc) => PointHistoryModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print("Error reading collection: $e");
      rethrow;
    }
  }
}
