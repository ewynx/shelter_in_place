import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier {
  var currentUser;
  var currentUserId;
  var currentUserEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  void setAuthServiceUserData(FirebaseUser user) {
    this.currentUser = user;
    this.currentUserId = user.uid;
    this.currentUserEmail = user.email;
  }

  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      FirebaseUser user = result.user;
      this.setAuthServiceUserData(user);
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
      this.setAuthServiceUserData(user);
      return user;
    } catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }

  void updateEmail(String email) async {
    final result = this.currentUser.updateEmail(email);
    this.currentUserEmail = email;
    print("Updated the user email address: " + result.toString());
  }

  void updatePassword(String password) async {
    final result = this.currentUser.updatePassword(password);
    print("Updated the user's password: " + result.toString());
  }

}
