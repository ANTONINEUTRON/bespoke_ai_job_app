import 'package:bespoke_ai_job_app/features/home/pages/signIn/signIn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupController extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context, String name, String email,
      String password, String confirmPassword) async {
    setLoading(true);

    
    await Future.delayed(Duration(seconds: 2));

    

    setLoading(false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }
}

class Signupform_page extends StatefulWidget {
  const Signupform_page({super.key});

  @override
  State<Signupform_page> createState() => _Signupform_pageState();
}

class _Signupform_pageState extends State<Signupform_page> {
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
    return ChangeNotifierProvider(
      create: (_) => SignupController(),
      child: Consumer<SignupController>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
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
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    label: 'Enter your email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildPasswordField(
                    label: 'Password',
                    controller: passwordController,
                    obscureText: passToggle,
                    togglePassword: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                  ),
                  SizedBox(height: 10),
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
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: provider.loading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text("Proceed"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: provider.loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                provider.signup(
                                  context,
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  confirmPasswordController.text,
                                );
                              }
                            },
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
        ),
        SizedBox(height: 8), // Reduced space between text and field
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(175, 175, 175, 1),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            labelText: 'Enter $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: Color.fromRGBO(175, 175, 175, 1),
              ),
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 8), // Reduced space between text and field
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(175, 175, 175, 1),
              ),
            ),
            labelText: 'Input $label',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(175, 175, 175, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: InkWell(
              onTap: togglePassword,
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
