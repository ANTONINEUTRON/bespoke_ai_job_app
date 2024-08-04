import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_profile_page.dart';
import 'change_password_page.dart';
//import 'login_page.dart'; // Import LoginPage

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Jane Doe';
  String _phoneNumber = '+234 9123456789';

  void _updateProfile(Map<String, String> updatedData) {
    setState(() {
      _name = updatedData['name']!;
      _phoneNumber = updatedData['phone']!;
    });
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      // Handle the error if necessary
      print("Error logging out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: const Color(0xFF092C4C),
              padding: const EdgeInsets.all(16.0),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 41,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: const Color(0xFFC0C0C0),
                            child: Image.asset(
                              'assets/Vector.png',
                              width: 40,
                              height: 53,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _name,
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          _phoneNumber,
                          style: TextStyle(
                            fontSize: 18.0,
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
          Positioned(
            left: 30,
            right: 30,
            bottom: 150,
            top: 270,
            child: Container(
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
                  const SizedBox(height: 60),
                  _buildListTileWithSpacing(
                    'assets/person.png',
                    'Edit profile',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            name: _name,
                            phoneNumber: _phoneNumber,
                            onSave: _updateProfile,
                          ),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  _buildListTileWithSpacing(
                    'assets/change_password.png',
                    'Change password',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePasswordPage(),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  _buildListTileWithSpacing(
                    'assets/Feedback.png',
                    'Feedback',
                        () {},
                  ),
                  _buildDivider(),
                  _buildListTileWithSpacing(
                    'assets/settings.png',
                    'Settings',
                        () {},
                  ),
                  _buildDivider(),
                  _buildListTileWithSpacing(
                    'assets/help.png',
                    'Help center',
                        () {},
                  ),
                  _buildDivider(),
                  _buildListTileWithSpacing(
                    'assets/logout.png',
                    'Logout',
                    _logout,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTileWithSpacing(String assetPath, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        leading: Container(
          width: 48,
          height: 48,
          child: Center(
            child: Image.asset(
              assetPath,
              width: 24,
              height: 24,
            ),
          ),
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.0,
      color: Colors.grey.shade300,
      thickness: 0.5,
    );
  }
}
