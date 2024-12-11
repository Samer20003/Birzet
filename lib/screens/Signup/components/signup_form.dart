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
  // إنشاء مفتاح للتحقق من صحة النموذج
  final _formKey = GlobalKey<FormState>();

  // إنشاء متحكمات النصوص
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

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xE2122088), // استخدم backgroundColor بدلاً من color
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
                Navigator.of(context).pop(); // إغلاق مربع الحوار
                // الانتقال إلى HomePageScreen
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
          ),
          const SizedBox(height: 16), // مسافة بين الحقول
          _buildTextFormField(
            icon: Icons.email,
            hint: "البريد الإلكتروني",
            controller: _emailController,
          ),
          const SizedBox(height: 16), // مسافة بين الحقول
          _buildTextFormField(
            icon: Icons.lock,
            hint: "كلمة المرور",
            controller: _passwordController,
            obscureText: _obscureTextPassword,
            toggleVisibility: () {
              setState(() {
                _obscureTextPassword = !_obscureTextPassword; // تبديل حالة إظهار كلمة المرور
              });
            },
          ),
          const SizedBox(height: 16), // مسافة بين الحقول
          _buildTextFormField(
            icon: Icons.lock,
            hint: "تأكيد كلمة المرور",
            controller: _confirmPasswordController,
            confirmationController: _passwordController,
            obscureText: _obscureTextConfirmPassword,
            toggleVisibility: () {
              setState(() {
                _obscureTextConfirmPassword = !_obscureTextConfirmPassword; // تبديل حالة إظهار كلمة المرور
              });
            },
          ),
          const SizedBox(height: 16), // مسافة بين الحقول
          _buildTextFormField(
            icon: Icons.phone,
            hint: "رقم الهاتف ",
            controller: _phoneController,
          ),
          const SizedBox(height: 16), // مسافة بين الحقول
          _buildDropdownField(),
          const SizedBox(height: 16), // مسافة بين الحقل وزر الإنشاء
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // إظهار مربع النجاح
                _showSuccessDialog();
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
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300), // تحديد عرض المستطيل
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          icon: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // تقليل حجم المستطيل
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // جعل الزوايا مستديرة
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'هذا الحقل لا يمكن أن يكون فارغاً.';
          }
          if (hint.contains('البريد الإلكتروني') &&
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'هذا ليس بريد إلكتروني صالح.';
          }
          if (hint.contains('كلمة المرور') && value.length < 6) {
            return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل.';
          }
          if (hint.contains('تأكيد كلمة المرور') &&
              value != confirmationController?.text) {
            return 'كلمة المرور لا تتطابق.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      constraints: BoxConstraints(maxWidth: 300), // تحديد عرض حقل الجنس
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
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // نفس تصميم الحقول الأخرى
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // جعل الزوايا مستديرة
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
