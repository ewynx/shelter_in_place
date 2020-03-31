import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  var currentUser;
  var currentUserId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  /*
   * ADD FIREBASE
   *  1. Firebase for Flutter
   * https://codelabs.developers.google.com/codelabs/flutter-firebase/index.html?index=..%2F..index#5
   *  2. Finish intergration in the project as described in
   * https://dev.to/aaronksaunders/simple-firebase-login-flow-in-flutter-now-firebase-23nk
   */

  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  // wrapping the firebase calls
  // Future createUser(
  //     {String firstName,
  //       String lastName,
  //       String email,
  //       String password}) async {}

  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      FirebaseUser user = result.user;
      this.currentUser = user;
      this.currentUserId = user.uid;

      return user;
    } catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }

  Future<FirebaseUser> createUser({String email, String password}) async {
    try {
      AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      FirebaseUser user = result.user;
      this.currentUser = user;
      this.currentUserId = user.uid;
      return user;
    } catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }
}
