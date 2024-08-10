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


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../repository/profile_repository.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String? photoURL;
  final ValueChanged<Map<String, String>> onSave;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.phoneNumber,
    this.photoURL,
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
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

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
      String? photoURL;
      if (_selectedImage != null) {
        photoURL = await _profileRepository.uploadProfilePicture(_selectedImage!);
      } else {
        photoURL = widget.photoURL;
      }

      await _profileRepository.updateProfile(
        displayName: _nameController.text,
        phoneNumber: _phoneController.text,
        verificationId: _verificationId,
        smsCode: '', // Replace with the actual SMS code input from the user
        photoURL: photoURL,
      );

      widget.onSave({
        'name': _nameController.text,
        'phone': _phoneController.text,
        'photoURL': photoURL ?? widget.photoURL ?? '', // Ensure a default empty string
      });

      _showSuccessMessage('Profile updated successfully');

      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _errorMessage = 'Error updating profile: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.teal,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
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
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : widget.photoURL != null
                    ? NetworkImage(widget.photoURL!) as ImageProvider
                    : null,
                child: _selectedImage == null && widget.photoURL == null
                    ? Icon(Icons.camera_alt, color: Colors.teal, size: 30)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
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

