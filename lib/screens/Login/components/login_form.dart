import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import '../../home_page/navigation_bar/home_page_screen.dart';
import '../../Login/components/forgot_password.dart'; // تأكد من استيراد صفحة استعادة كلمة المرور
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  // إنشاء مفتاح للتحقق من صحة النموذج
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void loginUser(BuildContext context) async {
    var loginBody = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.60:3000/api/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginBody),
      );

      if (response.statusCode == 200) {
        // إذا كانت بيانات تسجيل الدخول صحيحة
        var responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );

        // الانتقال إلى الصفحة الرئيسية أو الصفحة التالية
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const homepagescreen();
            },
          ),
        );

      } else if (response.statusCode == 401) {
        // إذا كان البريد الإلكتروني أو كلمة المرور غير صحيحة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid email or password')),
        );
      } else {
        // إذا كانت هناك مشكلة أخرى
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (error) {
      // إذا فشل الاتصال بالخادم
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to server: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "البريد الإلكتروني",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
              final emailRegExp = RegExp(emailPattern);
              if (!emailRegExp.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
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
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const homepagescreen(), // تأكد من استيراد HomePage
                ),
              );
            },
            child: Text(
              "تسجيل الدخول".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold, // جعل النص بالخط العريض
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(), // الانتقال إلى صفحة استعادة كلمة المرور
                ),
              );
            },
            child: const Text(
              "هل نسيت كلمة المرور؟",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold, // جعل النص بالخط العريض
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

