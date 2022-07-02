import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleAuth = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  AuthenticationService(this._firebaseAuth);
  Stream<User?> get userChanges => _firebaseAuth.userChanges();

  //! Error Dialog
  showErrDialog(BuildContext context, String error) {
    FocusScope.of(context).requestFocus(new FocusNode());
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.all(
                Radius.circular(10.0),
              ),
            ),
            title: Text("Error"),
            content: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  //! SignIn Email & Password
  Future<bool> signIn(
      String email, String password, BuildContext context) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          showErrDialog(context, "Invalid Email Adddres.");
          break;
        case 'wrong-password':
          showErrDialog(context, "Wrong Password.");
          break;
        case 'user-not-found':
          showErrDialog(context, "User not found.");
          break;
        default:
          showErrDialog(context, e.message as String);
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);
      }

      print('Error code: ${e.code}');
      print(e.message);
      return Future.value(false);
    }
  }

  //! SignUp Email & Password
  Future<bool> signUp(
      String email, String password, String name, BuildContext context) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseAuth.currentUser!.updateDisplayName(name);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          showErrDialog(context, "Email Already Exists.");
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);

        case 'invalid-email':
          showErrDialog(context, "Invalid Email Adddres.");
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);
        case 'weak-password':
          showErrDialog(context, "Please Choose a Stronger Password.");
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);
        default:
          showErrDialog(context, e.message as String);
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);
      }
    }
  }

  //! Continue with Google
  Future<bool> signInGoogle() async {
    GoogleSignInAccount? user;
    try {
      user = await _googleAuth.signIn();
    } catch (e) {
      print(e);

      return Future.value(false);
    }
    if (user != null) {
      final GoogleSignInAuthentication userAuth = await user.authentication;
      final AuthCredential userCredential = GoogleAuthProvider.credential(
          accessToken: userAuth.accessToken, idToken: userAuth.idToken);

      await _firebaseAuth.signInWithCredential(userCredential);

      return Future.value(true);
    }
    return Future.value(false);
  }

  //! Continue with Facebook
  Future<bool> signInFacebook(BuildContext context) async {
    LoginResult? loginResult;
    try {
      loginResult = await _facebookAuth.login();
    } catch (e) {
      print(e);

      return Future.value(false);
    }

    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      try {
        await _firebaseAuth.signInWithCredential(facebookAuthCredential);

        return Future.value(true);
      } on FirebaseAuthException catch (e) {
        showErrDialog(context, e.message as String);
      }
    }
    return Future.value(false);
  }

  //! Sign Out

  Future<bool> signOut() async {
    String provider = _firebaseAuth.currentUser!.providerData.first.providerId;

    if (provider == 'google.com') {
      await _googleAuth.disconnect();
    }

    await _firebaseAuth.signOut();

    return Future.value(true);
  }

  //! Send Reset Password Email

  Future<bool> resetPasswordEmail(BuildContext context, String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          showErrDialog(context, "Invalid Email Address.");
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);

        case 'user-not-found':
          showErrDialog(context, "User not found.");
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);

        default:
          showErrDialog(context, e.message as String);
          print('Error code: ${e.code}');
          print(e.message);
          return Future.value(false);
      }
    }
    return Future.value(true);
  }

  //! Update Profile Image
  Future<bool> updateProfileImage(String imageUrl) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return Future.value(false);
    }
    await user.updatePhotoURL(imageUrl);

    return Future.value(true);
  }

  //! Get Current User
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
