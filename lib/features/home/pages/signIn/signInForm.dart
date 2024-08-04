import 'package:bespoke_ai_job_app/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ),
                SizedBox(height: 30),
                _buildPasswordField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: passToggle,
                  togglePassword: () {
                    setState(() {
                      passToggle = !passToggle;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ChangeNotifierProvider(
                  create: (_) => SigninController(),
                  child: Consumer<SigninController>(
                    builder: (context, provider, child) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: provider.loading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                )
                              : Text("Signin"),
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
                                    provider.signin(
                                      context,
                                      emailController.text,
                                      _passwordController.text,
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    );
                                  }
                                },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password'),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
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
        SizedBox(height: 8),
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
        SizedBox(height: 8),
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

class SigninController extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signin(
      BuildContext context, String email, String password) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2)); // Simulate network call
    setLoading(false);
  }
}
