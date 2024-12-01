// import 'package:bespoke_ai_job_app/features/auth/pages/signIn/signIn_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class SignupController extends ChangeNotifier {
//   bool _loading = false;
//   bool get loading => _loading;
//
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> signup(BuildContext context, String name, String email,
//       String password, String confirmPassword) async {
//     if (password != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }
//
//     setLoading(true);
//
//     try {
//       // Sign up with Firebase Auth
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//       // Optionally, you can update the user's profile with their name
//       await userCredential.user!.updateProfile(displayName: name);
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Signup successful')),
//       );
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SignIn()),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       setLoading(false);
//     }
//   }
// }
//
// class Signupform_page extends StatefulWidget {
//   const Signupform_page({super.key});
//
//   @override
//   State<Signupform_page> createState() => _Signupform_pageState();
// }
//
// class _Signupform_pageState extends State<Signupform_page> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   bool passToggle = true;
//   bool confirmPassToggle = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double padding = screenWidth * 0.05;
//     final double fontSize = screenHeight * 0.02;
//
//     return ChangeNotifierProvider(
//       create: (_) => SignupController(),
//       child: Consumer<SignupController>(
//         builder: (context, provider, child) {
//           return SingleChildScrollView(
//             padding: EdgeInsets.all(padding),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildTextField(
//                     label: 'Full Name',
//                     controller: nameController,
//                     keyboardType: TextInputType.name,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your full name';
//                       }
//                       return null;
//                     },
//                     fontSize: fontSize,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   _buildTextField(
//                     label: 'Email Address',
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                     fontSize: fontSize,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   _buildPasswordField(
//                     label: 'Password',
//                     controller: passwordController,
//                     obscureText: passToggle,
//                     togglePassword: () {
//                       setState(() {
//                         passToggle = !passToggle;
//                       });
//                     },
//                     fontSize: fontSize,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   _buildPasswordField(
//                     label: 'Confirm Password',
//                     controller: confirmPasswordController,
//                     obscureText: confirmPassToggle,
//                     togglePassword: () {
//                       setState(() {
//                         confirmPassToggle = !confirmPassToggle;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       }
//                       if (value != passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                     fontSize: fontSize,
//                   ),
//                   SizedBox(height: screenHeight * 0.04),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       child: provider.loading
//                           ? CircularProgressIndicator(
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                             )
//                           : Text("Proceed",
//                               style: TextStyle(fontSize: fontSize)),
//                       style: ElevatedButton.styleFrom(
//                         padding:
//                             EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100),
//                         ),
//                       ),
//                       onPressed: provider.loading
//                           ? null
//                           : () {
//                               if (_formKey.currentState!.validate()) {
//                                 provider.signup(
//                                   context,
//                                   nameController.text,
//                                   emailController.text,
//                                   passwordController.text,
//                                   confirmPasswordController.text,
//                                 );
//                               }
//                             },
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required String? Function(String?) validator,
//     required double fontSize,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: fontSize,
//             color: Color.fromRGBO(47, 47, 47, 1),
//           ),
//         ),
//         SizedBox(height: 8), // Reduced space between text and field
//         TextFormField(
//           keyboardType: keyboardType,
//           controller: controller,
//           validator: validator,
//           decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(175, 175, 175, 1),
//               ),
//             ),
//             contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//             labelText: 'Enter $label',
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4),
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(175, 175, 175, 1),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPasswordField({
//     required String label,
//     required TextEditingController controller,
//     required bool obscureText,
//     required VoidCallback togglePassword,
//     String? Function(String?)? validator,
//     required double fontSize,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: fontSize,
//           ),
//         ),
//         SizedBox(height: 8), // Reduced space between text and field
//         TextFormField(
//           keyboardType: TextInputType.visiblePassword,
//           controller: controller,
//           validator: validator,
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(175, 175, 175, 1),
//               ),
//             ),
//             labelText: 'Input $label',
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color.fromRGBO(175, 175, 175, 1),
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             suffixIcon: InkWell(
//               onTap: togglePassword,
//               child: Icon(
//                 obscureText ? Icons.visibility : Icons.visibility_off,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../extensions/auth.dart';
//
//
//
//
// class SignupFormPage extends StatefulWidget {
//   const SignupFormPage({super.key});
//
//   @override
//   State<SignupFormPage> createState() => _SignupFormPageState();
// }
//
// class _SignupFormPageState extends State<SignupFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   bool passToggle = true;
//   bool confirmPassToggle = true;
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double padding = screenWidth * 0.05;
//     final double fontSize = screenHeight * 0.02;
//
//     return ChangeNotifierProvider(
//       create: (_) => SignupController(),
//       child: Consumer<SignupController>(builder: (context, provider, child) {
//         return SingleChildScrollView(
//           padding: EdgeInsets.all(padding),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildTextField(
//                   label: 'Full Name',
//                   controller: nameController,
//                   keyboardType: TextInputType.name,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your full name';
//                     }
//                     return null;
//                   },
//                   fontSize: fontSize,
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 _buildTextField(
//                   label: 'Email Address',
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                   fontSize: fontSize,
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 _buildPasswordField(
//                   label: 'Password',
//                   controller: passwordController,
//                   obscureText: passToggle,
//                   togglePassword: () {
//                     setState(() {
//                       passToggle = !passToggle;
//                     });
//                   },
//                   fontSize: fontSize,
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 _buildPasswordField(
//                   label: 'Confirm Password',
//                   controller: confirmPasswordController,
//                   obscureText: confirmPassToggle,
//                   togglePassword: () {
//                     setState(() {
//                       confirmPassToggle = !confirmPassToggle;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password';
//                     }
//                     if (value != passwordController.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                   fontSize: fontSize,
//                 ),
//                 SizedBox(height: screenHeight * 0.04),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     child: provider.loading
//                         ? CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     )
//                         : Text("Proceed",
//                         style: TextStyle(fontSize: fontSize)),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                     ),
//                     onPressed: provider.loading
//                         ? null
//                         : () {
//                       if (_formKey.currentState!.validate()) {
//                         provider.signupAnonymous(context);
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required String? Function(String?) validator,
//     required double fontSize,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: fontSize,
//             color: Color.fromRGBO(47, 47, 47, 1),
//           ),
//         ),
//         SizedBox(height: 8),
//         TextFormField(
//           keyboardType: keyboardType,
//           controller: controller,
//           validator: validator,
//           decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.teal),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPasswordField({
//     required String label,
//     required TextEditingController controller,
//     required bool obscureText,
//     required VoidCallback togglePassword,
//     String? Function(String?)? validator,
//     required double fontSize,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: fontSize,
//             color: Color.fromRGBO(47, 47, 47, 1),
//           ),
//         ),
//         SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           validator: validator,
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
//               onPressed: togglePassword,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.teal),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passToggle = true;
  bool confirmPassToggle = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double padding = screenWidth * 0.05;
    final double fontSize = screenHeight * 0.02;

    return ChangeNotifierProvider(
      create: (_) => SignupController(),
      child: Consumer<SignupController>(builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  label: 'Full Name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  fontSize: fontSize,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildTextField(
                  label: 'Email Address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  fontSize: fontSize,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildPasswordField(
                  label: 'Password',
                  controller: passwordController,
                  obscureText: passToggle,
                  togglePassword: () {
                    setState(() {
                      passToggle = !passToggle;
                    });
                  },
                  fontSize: fontSize,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildPasswordField(
                  label: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: confirmPassToggle,
                  togglePassword: () {
                    setState(() {
                      confirmPassToggle = !confirmPassToggle;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  fontSize: fontSize,
                ),
                SizedBox(height: screenHeight * 0.04),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: provider.loading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text("Proceed", style: TextStyle(fontSize: fontSize)),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: provider.loading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              provider.signupWithEmail(
                                context: context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    required double fontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback togglePassword,
    String? Function(String?)? validator,
    required double fontSize,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: togglePassword,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.teal),
            ),
          ),
        ),
      ],
    );
  }
}
