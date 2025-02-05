import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miles_and_more_clone/data_models/user/user_model.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getCurrentUser() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return null;

      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        throw Exception('User data not found.');
      }

      return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to get current user: $e');
    }
  }

  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String surName,
    required Gender gender,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user == null) throw Exception('User creation failed.');

      String uniqueSerialNumber = await _generateUniqueSerialNumber();

      UserModel userModel = UserModel(
          email: email,
          uid: user.uid,
          photoUrl: user.photoURL,
          miles: 0,
          points: 0,
          qualifyingPoints: 0,
          gender: gender,
          firstName: firstName,
          surName: surName,
          serviceCardNumber: uniqueSerialNumber);

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());

      return userModel;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<String> _generateUniqueSerialNumber() async {
    const int serialLength = 15;
    Random random = Random();

    while (true) {
      String serialNumber = List.generate(
        serialLength,
        (_) => random.nextInt(10).toString(),
      ).join();

      final querySnapshot = await _firestore
          .collection('users')
          .where('serviceCardNumber', isEqualTo: serialNumber)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return serialNumber;
      }
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (!userDoc.exists) {
          await _auth.signOut();
          throw Exception('User data not found.');
        }
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      }

      return null;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<bool> isEmailInUse(String email) async {
    final querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
