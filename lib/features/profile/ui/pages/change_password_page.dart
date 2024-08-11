// import 'package:flutter/material.dart';
//
// class ChangePasswordPage extends StatelessWidget {
//   const ChangePasswordPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Change Password',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Current Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'New Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Confirm New Password',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle password change logic
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//               ),
//               child: const Text('Change Password',
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(code: 'no-user', message: 'No user is currently signed in.');
      }

      String email = user.email!;
      String currentPassword = _currentPasswordController.text.trim();
      String newPassword = _newPasswordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();

      if (newPassword != confirmPassword) {
        _showErrorDialog('New passwords do not match.');
        return;
      }

      // Re-authenticate user
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
      await user.reauthenticateWithCredential(credential);

      // Change password
      await user.updatePassword(newPassword);

      _showSuccessDialog('Password changed successfully.');

    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
