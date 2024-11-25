// import 'package:flutter/material.dart';
//
// class ResetPasswordPage extends StatefulWidget {
//   final String email; // Added to receive email from ForgotPasswordPage
//
//   ResetPasswordPage({required this.email});
//
//   @override
//   _ResetPasswordPageState createState() => _ResetPasswordPageState();
// }
//
// class _ResetPasswordPageState extends State<ResetPasswordPage> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _passwordVisible = false;
//   bool _confirmPasswordVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double padding = screenWidth * 0.05;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('Reset Password'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(padding),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Your new password must be different from previously used password',
//                 style: TextStyle(
//                   fontSize: screenHeight * 0.02,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Text(
//                 'Password',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: screenHeight * 0.02,
//                   color: Colors.black87
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: !_passwordVisible,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please create a new password';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Create new password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _passwordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _passwordVisible = !_passwordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Text(
//                 'Confirm Password',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: screenHeight * 0.02,
//                     color: Colors.black87
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 obscureText: !_confirmPasswordVisible,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please confirm your new password';
//                   }
//                   if (value != _passwordController.text) {
//                     return 'Passwords do not match';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Confirm new password',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _confirmPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _confirmPasswordVisible = !_confirmPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.04),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Handle password reset here
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding:
//                         EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: Colors.teal,
//                   ),
//                   child: Text(
//                     'Set Password',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: screenHeight * 0.02,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
