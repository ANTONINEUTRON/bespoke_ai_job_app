import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../registration/ui/pages/signin/signIn_page.dart';

class ProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? verificationId,
    String? smsCode,
    String? photoURL,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(displayName);

        if (verificationId != null && smsCode != null) {
          final credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          await user.updatePhoneNumber(credential);
        }

        if (photoURL != null) {
          await user.updatePhotoURL(photoURL);
        }

        await user.reload();
        user = _auth.currentUser;
      } else {
        throw Exception('No user is currently signed in.');
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String verificationId) onCodeSent) async {
    verificationCompleted(PhoneAuthCredential credential) async {
      await _auth.currentUser?.updatePhoneNumber(credential);
    }

    verificationFailed(FirebaseAuthException authException) {
      throw Exception('Phone number verification failed: ${authException.message}');
    }

    codeSent(String verificationId, int? resendToken) {
      onCodeSent(verificationId);
    }

    codeAutoRetrievalTimeout(String verificationId) {}

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<String> uploadProfilePicture(File image) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = _storage.ref().child('profile_pictures').child(fileName);
      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw Exception('Failed to upload profile picture: $e');
    }
  }
}











