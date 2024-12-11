// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthRepository {
  final authInstance = FirebaseAuth.instance;

  /// Login
  Future<void> loginUser(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      log("$e");
    }
  }

  /// Logout
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      log("$e");
    }
  }
}
