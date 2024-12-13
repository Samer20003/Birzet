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

    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');

    try {
      var response = await http.post(
        Uri.parse('http://localhost:3000/api/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginBody),
      );

      // // طباعة الـ statusCode و الـ response body للمساعدة في الفحص
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

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
      } else if (response.statusCode == 404) {
       // إذا كان البريد الإلكتروني غير موجود
        var responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not found. Please check your email address.')),
        );
      } else if (response.statusCode == 401) {
        //إذا كانت كلمة المرور غير صحيحة
        var responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid password. Please check your password.')),
        );
      } else if (response.statusCode == 400) {
        //إذا كانت البيانات غير مكتملة
        var responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Please provide email and password')),
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
      key: _formKey, // ربط الـformKey
      child: Column(
        children: [
          TextFormField(
            controller: _emailController, // ربط الـcontroller هنا
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
              controller: _passwordController, // ربط الـcontroller هنا
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
              if (_formKey.currentState?.validate() ?? false) {
                loginUser(context); // إرسال البيانات إذا كانت صحيحة
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fix the errors')),
                );
              }
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
