import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double padding = screenWidth * 0.05;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Forgot Password?'),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your registered email address',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Email Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.02,
                  color: Color.fromRGBO(47, 47, 47, 1),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add additional email format validation if needed
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        print(
                            'Sending password reset email to: ${emailController.text}');
                        await _auth.sendPasswordResetEmail(
                          email: emailController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Password reset email sent. Please check your email.')),
                        );

                        // Navigate back to the login page
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.toString()}')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color.fromRGBO(3, 92, 70, 1),
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
