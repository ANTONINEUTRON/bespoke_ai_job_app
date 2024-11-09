// lib/services/auth.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../features/registration/ui/pages/signIn/signIn_page.dart';



class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // User is signed in
        // You can navigate to another page or handle user data here
      }
    } catch (e) {
      // Handle errors
      print('Error during Google sign-in: $e');
    }
  }
}

// SignUp Authentication
// class SignupController extends ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> signupAnonymous(BuildContext context) async {
//     setLoading(true);
//
//     try {
//       // Sign up anonymously with Firebase Auth
//       UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Anonymous Signup successful')),
//       );
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SignInPage()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       setLoading(false);
//     }
//   }
// }

// SignUp authentication
class SignupController extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signupWithEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    setLoading(true);

    try {
      // Sign up with email and password using Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.teal,
          content: Text('Signup successful', style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setLoading(false);
    }
  }
}


// SignIn Authentication
class SigninController extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> signin(String email, String password) async {
    setLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoading(false);
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      print('Failed to sign in: $e');
      return false;
    }
  }
}




