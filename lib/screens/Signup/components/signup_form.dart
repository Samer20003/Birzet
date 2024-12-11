import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import '../../home_page/navigation_bar/home_page_screen.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'Male';
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  void registerUser(BuildContext context) async {
    var regBody = {
      "name": _usernameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "phoneNumber": _phoneController.text,
      "gender": _gender
    };
    try {
      var response = await http.post(
        Uri.parse('http://localhost:3000/api/signup'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')),
        );
        _showSuccessDialog();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const homepagescreen();
            },
          ),
        );
      } else {
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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xE2122088),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 48),
              SizedBox(height: 16),
              Text(
                "لقد تم إنشاء حسابك بنجاح",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const homepagescreen()),
                );
              },
              child: const Text(
                "حسناً",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextFormField(
            icon: Icons.person,
            hint: "اسم المستخدم",
            controller: _usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال اسم المستخدم';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextFormField(
            icon: Icons.email,
            hint: "البريد الإلكتروني",
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال البريد الإلكتروني';
              }
              if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                return 'يرجى إدخال بريد إلكتروني صالح';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextFormField(
            icon: Icons.lock,
            hint: "كلمة المرور",
            controller: _passwordController,
            obscureText: _obscureTextPassword,
            toggleVisibility: () {
              setState(() {
                _obscureTextPassword = !_obscureTextPassword;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال كلمة المرور';
              }
              if (value.length < 6) {
                return 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextFormField(
            icon: Icons.lock,
            hint: "تأكيد كلمة المرور",
            controller: _confirmPasswordController,
            confirmationController: _passwordController,
            obscureText: _obscureTextConfirmPassword,
            toggleVisibility: () {
              setState(() {
                _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
              });
            },
            validator: (value) {
              if (value != _passwordController.text) {
                return 'كلمة المرور غير متطابقة';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextFormField(
            icon: Icons.phone,
            hint: "رقم الهاتف",
            controller: _phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال رقم الهاتف';
              }
              if (!RegExp(r'^(059|056)[0-9]{7}$').hasMatch(value) && !RegExp(r'^\+?[0-9]{8,15}$').hasMatch(value)) {
                return 'يرجى إدخال رقم هاتف صالح';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildDropdownField(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                registerUser(context);
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
            ),
            child: Text("إنشاء حساب".toUpperCase()),
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

  Widget _buildTextFormField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    TextEditingController? confirmationController,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          suffixIcon: toggleVisibility != null
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: toggleVisibility,
          )
              : null,
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      child: DropdownButtonFormField<String>(
        value: _gender,
        items: ['Male', 'Female'].map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: "اختر الجنس",
          icon: Icon(Icons.person_outline),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _gender = value!;
          });
        },
      ),
    );
  }
}
