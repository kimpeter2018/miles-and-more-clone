import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miles_and_more_clone/data_models/user/user_model.dart';
import 'package:miles_and_more_clone/features/auth/auth_repository.dart';

final userProvider = FutureProvider<UserModel?>((ref) async {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final user = firebaseAuth.currentUser;

  if (user == null) {
    return null;
  }

  final firestore = FirebaseFirestore.instance;
  final userDoc = await firestore.collection('users').doc(user.uid).get();

  if (!userDoc.exists) {
    throw Exception('User data not found in Firestore');
  }

  return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
});
