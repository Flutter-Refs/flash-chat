// ignore_for_file: null_check_always_fails

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final _auth = FirebaseAuth.instance;

  User getCurrentUser() {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e);
    }
    return null!;
  }

  /// Login by email & password
  Future<bool> login(String email, String password) async {
    try {
      await this._auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// Create new user
  Future<bool> register(String email, String password) async {
    try {
      await this._auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> logout() async {
    try {
      await this._auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
