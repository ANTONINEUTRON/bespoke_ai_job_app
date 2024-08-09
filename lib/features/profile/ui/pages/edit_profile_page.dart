// import 'package:flutter/material.dart';
//
// class EditProfilePage extends StatefulWidget {
//   final String name;
//   final String phoneNumber;
//   final ValueChanged<Map<String, String>> onSave;
//
//   const EditProfilePage({
//     super.key,
//     required this.name,
//     required this.phoneNumber,
//     required this.onSave,
//   });
//
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }
//
// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _phoneController;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.name);
//     _phoneController = TextEditingController(text: widget.phoneNumber);
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile',
//         style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF092C4C),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _phoneController,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 widget.onSave({
//                   'name': _nameController.text,
//                   'phone': _phoneController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF092C4C), // Background color
//               ),
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../../repository/profile_repository.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final ValueChanged<Map<String, String>> onSave;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.onSave,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late ProfileRepository _profileRepository;

  bool _isLoading = false;
  String? _errorMessage;
  String? _verificationId; // For phone number verification

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _profileRepository = ProfileRepository();
    _startPhoneVerification();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _startPhoneVerification() async {
    try {
      await _profileRepository.verifyPhoneNumber(
        _phoneController.text,
            (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to start phone verification: $e';
      });
    }
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Please fill in all fields';
      });
      return;
    }

    try {
      await _profileRepository.updateProfile(
        displayName: _nameController.text,
        phoneNumber: _phoneController.text,
        verificationId: _verificationId,
        smsCode: '', // Replace with the actual SMS code input from the user
      );

      widget.onSave({
        'name': _nameController.text,
        'phone': _phoneController.text,
      });

      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _errorMessage = 'incomplete credentials: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF092C4C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                   onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                       ),
                    child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

