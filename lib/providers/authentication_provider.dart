import 'package:chat_app/resources/Strings.dart';
import 'package:chat_app/screens/messages_screen.dart';
import 'package:chat_app/utils/RouteGenerator.dart';
import 'package:chat_app/utils/navigation_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    required String birthDate,
    required BuildContext context,
  }) async {
    NavigationUtils.showLoadingDialog(context);
    try {
      UserCredential _userCredidentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      User? _user = _userCredidentials.user;

      await FirebaseFirestore.instance
        .collection(Strings.usersCollection)
        .doc(_user?.uid)
        .set({
          Strings.userModelId: _user?.uid,
          Strings.userModelName: username,
          Strings.userModelBirthDate: birthDate,
          Strings.userModelImagePath: _user?.photoURL,
      });
      
      await _firebaseAuth.signOut();

      NavigationUtils.hideDialog(context);
      NavigationUtils.showMyDialog(
        context: context,
        bodyText: Strings.signUpComplete,
        onClick: () => Navigator.of(context).pushNamedAndRemoveUntil(
          SIGN_IN_PAGE,
          ModalRoute.withName(SIGN_IN_PAGE)
        )
      );
    } on FirebaseAuthException catch(error) {
      NavigationUtils.hideDialog(context);
      if (error.code == Strings.emailAlreadyUsedCode) {
        NavigationUtils.showMyDialog(
            context: context,
            bodyText: Strings.emailAlreadyUsedCode
        );
      }else if (error.code == Strings.weakPassword) {
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

  void signIn({
    required String email,
    required String password,
    required BuildContext context
    }) async {
    NavigationUtils.showLoadingDialog(context);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      NavigationUtils.hideDialog(context);
      Navigator.of(context).pushNamedAndRemoveUntil(
          MESSAGES_PAGE,
          (Route<dynamic> route) => false
      );
    } on FirebaseAuthException catch (error) {
      NavigationUtils.hideDialog(context);
      if (error.code == Strings.userNotFoundCode) {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.errorUserNotFound
        );
      } else if (error.code == Strings.wrongPasswordCode){
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.errorWrongPassword
        );
      } else if (error.code == Strings.disabledUserCode) {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.errorDisabledUser
        );
      } else {
        NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.error
        );
      }
    }
  }

  void signOut({required BuildContext context}) async {
    NavigationUtils.showLoadingDialog(context);
    try {
      await _firebaseAuth.signOut().then((value) {
        NavigationUtils.hideDialog(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
          SIGN_IN_PAGE,
          (Route<dynamic> route) => false
        );
      });
      //Navigator.pushNamedAndRemoveUntil(
      //    context,
      //    MAIN_APP,
      //    (Route<dynamic> route) => false
      //);
    } on FirebaseAuthException catch (error) {
      NavigationUtils.hideDialog(context);
      NavigationUtils.showMyDialog(
          context: context,
          bodyText: Strings.errorLogOut
      );
    }
  }

  Future<bool> reloadFirebase({required BuildContext context}) async {
    bool _isUserStillConnected = true;
    try{
      await currentUser?.reload();
      if (currentUser == null) {
        _isUserStillConnected = false;
        showDisconnectDialog(context: context);
      }
    } on FirebaseAuthException catch(error) {
      _isUserStillConnected = false;
      showDisconnectDialog(context: context);
    }
    return _isUserStillConnected;
  }

  void showDisconnectDialog({required BuildContext context}) {
    NavigationUtils.showMyDialog(
      context: context,
      bodyText: Strings.errorDisabledUser,
      onClick: () {
        signOut(context: context);
      }
    );
  }

}