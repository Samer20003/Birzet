import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../home_page/home_page_screen.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatelessWidget {
   SignUpForm({
    Key? key,
  }) : super(key: key);

  // إنشاء مفتاح للتحقق من صحة النموذج
  final _formKey = GlobalKey<FormState>();

  // إنشاء متحكمات النصوص
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

   void registerUser(BuildContext context) async {
     var regBody = {
       "name": _usernameController.text,
       "email": _emailController.text,
       "password": _passwordController.text
     };
     try {
       var response = await http.post(
         Uri.parse('http://192.168.1.60:3000/api/signup'),
         headers: {"Content-Type": "application/json"},
         body: jsonEncode(regBody),
       );
       if (response.statusCode == 200) {
         // إذا كانت الاستجابة ناجحة
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('User registered successfully')),
         );
         Navigator.push(
           context,
           MaterialPageRoute(
             builder: (context) {
               return const homepagescreen();
             },
           ),
         );

       } else {
         // إذا كانت هناك مشكلة
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Error: ${response.body}')),
         );
       }
     } catch (error) {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Failed to connect to server: $error')),
       );
     }
   }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //userName
          TextFormField(
            controller: _usernameController,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Username",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "your email",
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
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
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {

              // تحقق من صحة المدخلات
              if (_formKey.currentState?.validate() ?? false) {
                // إذا كانت المدخلات صحيحة، تنفيذ التسجيل أو الانتقال إلى الصفحة التالية
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                registerUser(context);
                // يمكنك هنا تنفيذ الانتقال إلى الصفحة الرئيسية أو أي عملية أخرى

              } else {
                // إذا كانت المدخلات غير صحيحة
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields correctly')));
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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