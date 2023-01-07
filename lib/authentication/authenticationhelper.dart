import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class authenticationhelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  //sign up

  Future<String?> signup({required String email,required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseException catch (error) {
      return error.message;
    }
  }

  //sign in
  Future<String?> signin({required String email,required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  //sign out

  Future signout() async {
    await auth.signOut();
    log("sign out");
  }
}
