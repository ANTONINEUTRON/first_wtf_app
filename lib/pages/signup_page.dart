import 'package:first_wtf_app/widgets/custom_button.dart';
import 'package:first_wtf_app/widgets/custom_textfield.dart';
import 'package:first_wtf_app/widgets/password_textfield.dart';
import 'package:first_wtf_app/widgets/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for manual validation
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signup() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirm = _confirmPasswordController.text.trim();

    if (username.isEmpty) {
      _showError("Username cannot be empty");
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showError("Enter a valid email");
    } else if (password.length < 6) {
      _showError("Password must be at least 6 characters");
    } else if (password != confirm) {
      _showError("Passwords do not match");
    } else {
      // All good
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            const SizedBox(height: 100),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.play(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            const Text(
              "Create an account to continue",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            // 👇 connect controllers to fields
            CustomTextField(label: "Username", controller: _usernameController),
            CustomTextField(label: "Email", controller: _emailController),
            PasswordTextfield(controller: _passwordController),
            PasswordTextfield(controller: _confirmPasswordController),

            CustomButton(
              text: 'Sign up',
              onPressed: _signup, // 👈 validation logic here
            ),
            const SocialSignIn(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
