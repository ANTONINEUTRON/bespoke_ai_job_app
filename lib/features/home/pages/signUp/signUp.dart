import 'package:bespoke_ai_job_app/features/home/pages/signIn/signIn.dart';
import 'package:bespoke_ai_job_app/features/home/pages/signUp/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../extensions/auth.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Create An Account',
          style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Create an account and gain access to our features',
                  style: TextStyle(
                      color: Color.fromRGBO(47, 47, 47, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              // SizedBox(height: 5),
              Signupform_page(),
              SizedBox(height: 5),
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
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/google_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      AuthMethods().signInWithGoogle(context);
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
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(47, 47, 47, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    child: const Text("Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
