import 'dart:io';

import 'package:bespoke_ai_job_app/features/profile/ui/pages/feed_back_page.dart';
import 'package:bespoke_ai_job_app/features/profile/ui/pages/help_center_page.dart';
import 'package:bespoke_ai_job_app/features/profile/ui/pages/terms_condition_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../../../registration/ui/pages/signin/signIn_page.dart';
import '../widgets/icon_widget.dart';
import 'change_password_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser;
  TextEditingController nameController = TextEditingController();

  bool _isAdsOff = true;
  final ImagePicker _picker = ImagePicker();

  // Function to allow the user to pick and upload a new image
  Future<void> _updateProfilePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      try {
        // Print the file path for debugging
        print("Picked file: ${pickedFile.path}");

        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_pictures/${currentUser?.uid}.jpg');
        final uploadTask = storageRef.putFile(File(pickedFile.path));

        final snapshot = await uploadTask;
        final downloadUrl = await snapshot.ref.getDownloadURL();

        // Update the user's photo URL in Firebase Auth
        await currentUser?.updatePhotoURL(downloadUrl);

        setState(() {
          currentUser = FirebaseAuth.instance.currentUser;
        });

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile picture updated successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        print("Error updating profile picture: $e");
      }
    } else {
      print("No image selected");
    }
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, SignInPage.route());
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  // Function to show the Edit Profile dialog
  Future<void> _showEditProfileDialog() async {
    nameController.clear();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Username'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog without saving
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                // Update the user's profile (Firebase update)
                try {
                  await currentUser?.updateDisplayName(nameController.text);
                  setState(() {
                    currentUser = FirebaseAuth
                        .instance.currentUser; // Refresh currentUser
                  });

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.teal,
                      content: Text(
                        'Profile successfully updated',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (e) {
                  print("Error updating name: $e");
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Function to show delete account confirmation dialog
  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          elevation: 1,
          title: const Text(
            'Delete Account',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete'),
              onPressed: () async {
                Navigator.of(context).pop();

                try {
                  await FirebaseAuth.instance.currentUser?.delete();
                  // Show the Snackbar after account deletion
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account successfully deleted'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  Navigator.pushReplacement(context, SignInPage.route());
                } catch (e) {
                  print('Error deleting account: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error deleting account'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Listen for authentication state changes
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            currentUser = snapshot.data;

            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(16.0),
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _updateProfilePicture,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 38,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: currentUser?.photoURL !=
                                            null
                                        ? NetworkImage(currentUser!.photoURL!)
                                        : null,
                                    child: currentUser?.photoURL == null
                                        ? Image.asset(
                                            'assets/Vector.png',
                                            width: 40,
                                            height: 53,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                currentUser?.displayName ?? "No Name Set",
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                currentUser?.email ?? "No Email Set",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 240),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 1),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 4),
                              _buildListTileWithSpacing(
                                Icons.person,
                                'Edit Username',
                                _showEditProfileDialog,
                              ),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.lock,
                                'Change password',
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePasswordPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.help_outline,
                                'Help center',
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HelpCenterPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.thumb_up,
                                'FeedBack',
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeedbackPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.security,
                                'Terms and Conditions',
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TermsConditionPage(),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              buildToggleAds(),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.delete,
                                'Delete Account',
                                _showDeleteConfirmationDialog,
                                trailing: SizedBox.shrink(),
                              ),
                              _buildDivider(),
                              _buildListTileWithSpacing(
                                Icons.logout,
                                'Logout',
                                _logout,
                                trailing: SizedBox
                                    .shrink(), // This removes the trailing icon
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/wall.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_remove,
                      color: Theme.of(context).primaryColor,
                      size: 200,
                    ),
                     Text(
                      "You are not signed in!\nYou have to sign in to access certain features",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildListTileWithSpacing(
      IconData icon, String title, VoidCallback onTap,
      {Widget? trailing, bool isDelete = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: ListTile(
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: Colors.teal,
            ),
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isDelete ? Colors.red : Colors.teal,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20.0,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildToggleAds() => SwitchListTile(
        title: Text(
          _isAdsOff ? 'Ads On' : 'Ads Off',
          style: TextStyle(color: _isAdsOff ? Colors.teal : Colors.black54),
        ),
        subtitle: Text(_isAdsOff ? 'Ads are on' : 'Ads are off'),
        value: _isAdsOff,
        activeColor: Colors.teal,
        secondary: IconWidget(icon: Icons.ad_units, color: Colors.teal),
        onChanged: (bool value) {
          setState(() {
            _isAdsOff = value;
          });
        },
      );

  Widget _buildDivider() {
    return const Divider(
      thickness: 1,
      color: Color(0xFFEBEBEB),
    );
  }
}
