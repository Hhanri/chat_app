import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {

  FirebaseAuth _firebaseAuthauth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuthauth.currentUser;

  Stream<User?> get userState => _firebaseAuthauth.authStateChanges();
  Stream<User?> get userIdTokenChange => _firebaseAuthauth.idTokenChanges();
  Stream<User?> get userChange => _firebaseAuthauth.userChanges();
}