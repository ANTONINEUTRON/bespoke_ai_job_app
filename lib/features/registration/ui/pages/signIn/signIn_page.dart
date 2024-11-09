// import 'package:bespoke_ai_job_app/features/auth/pages/signIn/signInForm_page.dart';
// import 'package:bespoke_ai_job_app/features/auth/pages/signUp/signUp_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import '../../../../extensions/auth.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({super.key});
//
//   static route() => MaterialPageRoute(
//         builder: (context) => SignIn(),
//       );
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           'Welcome back!',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Text(
//                   'Login to your account',
//                   style: TextStyle(
//                       color: Color.fromRGBO(47, 47, 47, 1),
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               SizedBox(height: 10),
//               SignInForm(),
//               SizedBox(height: 16),
//               Row(
//                 children: [
//                   Flexible(
//                     child: Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Or continue with',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     child: Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Image.asset('assets/google_icon.png'),
//                     iconSize: 40,
//                     onPressed: () {
//                       AuthMethods().signInWithGoogle(context);
//                       // Handle Google sign-in
//                     },
//                   ),
//                   SizedBox(width: 10), // Adjust the width as needed
//                   IconButton(
//                     icon: Image.asset('assets/facebook_icon.png'),
//                     iconSize: 40,
//                     onPressed: () {
//                       print('facebo0k');
//                     },
//                   ),
//                   SizedBox(width: 10), // Adjust the width as needed
//                   IconButton(
//                     icon: Image.asset('assets/apple_icon.png'),
//                     iconSize: 40,
//                     onPressed: () {
//                       // Handle Apple sign-in
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account?",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromRGBO(47, 47, 47, 1),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: (){
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignUpForm()));
//                     },
//                     child: const Text("Sign up",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.teal,
//                       ),),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:bespoke_ai_job_app/features/registration/ui/pages/signIn/signInForm_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../extensions/auth.dart';
import '../signUp/signUp_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static route() => MaterialPageRoute(
    builder: (context) => SignInPage(),
  );

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add top space for welcome text
              SizedBox(height: 60), // Adjust as needed
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10), // Space between welcome text and subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Color.fromRGBO(47, 47, 47, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SignInFormPage(), // Updated SignInForm to include anonymous sign-in
              SizedBox(height: 16),
              const Row(
                children: [
                  Flexible(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                      AuthMethods().signInWithGoogle(context);
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Image.asset('assets/facebook_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      print('Facebook sign-in not implemented');
                    },
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Image.asset('assets/apple_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      print('Apple sign-in not implemented');
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(47, 47, 47, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpFormPage(),
                        ),
                      );
                    },
                    child: const Text(
                      " Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}


