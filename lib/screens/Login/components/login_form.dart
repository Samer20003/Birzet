import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../Utils/router.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../Login/components/forgot_password.dart';
import '../../users/homepageUsers/HomePageScreenUsers.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final loginBody = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    try {
      // Make the POST request to your API
      final response = await http.post(
        Uri.parse('http://localhost:4000/api/v1/auth/signin'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginBody),
      );

      // Handle the API response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        // Navigate to the homepage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const homepagescreen(),
          ),
        );
      } else if (response.statusCode == 401) {
        // Invalid credentials
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password.')),
        );
      } else {
        // Other errors
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData['message'] ?? 'Login failed')),
        );
      }
    } catch (error) {
      // Handle server or connection errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to the server: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email input field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "البريد الإلكتروني",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email.';
              }
              if (!RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                  .hasMatch(value)) {
                return 'Please enter a valid email.';
              }
              return null;
            },
          ),
          const SizedBox(height: defaultPadding),

          // Password input field
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "كلمة المرور",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password.';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters.';
              }
              return null;
            },
          ),
          const SizedBox(height: defaultPadding),

          // Login button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                loginUser(context);
              }
            },
            child: const Text('تسجيل الدخول'),
          ),
          const SizedBox(height: defaultPadding),

          // Forgot Password link
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              );
            },
            child: const Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Sign-up link
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
