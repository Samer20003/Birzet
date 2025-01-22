import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data' as typed_data;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:html' as html; // Import for handling web-specific file upload

import '../../../Controllers/AuthController.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  typed_data.Uint8List? _imageBytes;
  String? _imageName;

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _gender = 'ذكر';
  String _userType = 'مستخدم';
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  void _pickImageWeb() async {
    final uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final file = uploadInput.files?.first;
      if (file != null) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);

        reader.onLoadEnd.listen((_) {
          setState(() {
            _imageBytes = reader.result as Uint8List;
            _imageName = file.name;
          });
        });
      }
    });
  }

  void registerUser(BuildContext context) async {
    AuthController authController = AuthController();
    var regBody = {
      "name": _usernameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "phoneNumber": _phoneController.text,
      "gender": _gender,
      "userType": _userType,
      "role":"admin"
     };

    final result = await authController.signupWithDio(
      regBody['name']!,
      regBody['email']!,
      regBody['password']!,
      _imageBytes,

      regBody['phoneNumber']!,
      regBody['gender']!,
      regBody['userType']!,
    );

    if (result['success']) {
      _showSuccessDialog();
    } else {
      Fluttertoast.showToast(
        msg: "Registration failed: ${result['message']}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print("Registration failed: ${result['message']}");
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
                Navigator.pushReplacementNamed(context, '/home');
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
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
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
            controller: _emailController
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

          ),
          const SizedBox(height: 16),
          _buildDropdownField(),
          const SizedBox(height: 16),
          _buildUserTypeDropdown(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: _imageBytes == null
                        ? const Text("تحميل الصورة")
                        : Image.memory(
                      _imageBytes!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.upload_file),
                onPressed: _pickImageWeb,
              ),
            ],
          ),
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
      constraints: const BoxConstraints(maxWidth: 500),
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
      constraints: const BoxConstraints(maxWidth: 500),
      child: DropdownButtonFormField<String>(
        value: _gender,
        items: ['ذكر', 'أنثى'].map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: "اختر الجنس",
          icon: const Icon(Icons.person_outline),
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

  Widget _buildUserTypeDropdown() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: DropdownButtonFormField<String>(
        value: _userType,
        items: ['مستخدم', 'مستثمر'].map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(type),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: "اختر الفئة",
          icon: const Icon(Icons.group),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _userType = value!;
          });
        },
      ),
    );
  }
}
