import 'package:bespoke_ai_job_app/features/home/pages/signIn/signInForm.dart';
import 'package:bespoke_ai_job_app/features/home/pages/signUp/signUp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
       title:  Text(
          'Welcome back!',
          style: 
          TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.w600),
        ),
      ),

      
     body:  SingleChildScrollView(
       child: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text(
                'Login to your account',
                style: TextStyle(
                  color: Color.fromRGBO(47, 47, 47, 1),
                fontSize: 18, 
                fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
       
              SignInForm(),
              SizedBox(height: 10),
              
              
             Row(
                children: [
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
             ),
           
        SizedBox(height: 10),
        
       
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/google_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      // Handle Google sign-in
                    },
                  ),
                  SizedBox(width: 10), // Adjust the width as needed
                  IconButton(
                    icon: Image.asset('assets/facebook_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      print('facebo0k');
                    },
                  ),
                  SizedBox(width: 10), // Adjust the width as needed
                  IconButton(
                    icon: Image.asset('assets/apple_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      // Handle Apple sign-in
                    },
                  ),
                ],
              ),
       
               SizedBox(height: 10),
       
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SignUpForm()));
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
       ],
       
        ),
        ),
     ), 
    );
  }
}