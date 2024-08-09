import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Update the user's display name and phone number
  Future<void> updateProfile({
    required String displayName,
    required String phoneNumber,
    String? verificationId,
    String? smsCode,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Update display name
        await user.updateDisplayName(displayName);

        // Update phone number
        if (verificationId != null && smsCode != null) {
          final credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );
          await user.updatePhoneNumber(credential);
        }

        // Reload user to update display name and phone number
        await user.reload();
        user = _auth.currentUser;
      } else {
        throw Exception('No user is currently signed in.');
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  /// Verify the phone number and send an SMS code
  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String verificationId) onCodeSent) async {
    verificationCompleted(PhoneAuthCredential credential) async {
      // Auto-resolution, if you have received the code automatically
      await _auth.currentUser?.updatePhoneNumber(credential);
    }

    verificationFailed(FirebaseAuthException authException) {
      throw Exception('Phone number verification failed: ${authException.message}');
    }

    codeSent(String verificationId, int? resendToken) {
      // Code sent, pass the verificationId to be used later
      onCodeSent(verificationId);
    }

    codeAutoRetrievalTimeout(String verificationId) {
      // Called when auto-retrieval times out
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
