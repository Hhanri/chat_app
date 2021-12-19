import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get userState => _firebaseAuth.authStateChanges();
  Stream<User?> get userIdTokenChange => _firebaseAuth.idTokenChanges();
  Stream<User?> get userChange => _firebaseAuth.userChanges();

  void signUp({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    NavigationUtils.showLoadingDialog(context);
    try {
      UserCredential _userCredidential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      NavigationUtils.hideDialog(context);
      NavigationUtils.showMyDialog(
        context: context,
        bodyText: Strings.signUpComplete,
        onClick: () => Navigator.pushNamedAndRemoveUntil(
          context,
          SIGN_IN_PAGE,
          ModalRoute.withName(SIGN_IN_PAGE)
        )
      );
    } on FirebaseAuthException catch(error) {
      NavigationUtils.hideDialog(context);
      if (error.code == Strings.weakPassword) {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.weakPassword
        );
      } else if (error.code == Strings.emailAlreadyUsedCode) {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.weakPassword
        );
      } else {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.errorAuthSignUp
        );
      }
    }
  }

  void signIn() {

  }

  void signOut() {

  }

}