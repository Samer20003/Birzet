import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  String _profileImage = '';
  final ImagePicker _picker = ImagePicker();
  String _gender = '';
  DateTime? _birthDate;

  @override
  void initState() {
    super.initState();
    _nameController.text = "";
    _emailController.text = "";
    _phoneController.text = "";
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile.path;
      });
    }
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  void _showPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تعديل كلمة المرور"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField("كلمة المرور الحالية", _currentPasswordController, obscureText: true, icon: Icons.lock),
              const SizedBox(height: 16),
              _buildTextField("كلمة المرور الجديدة", _newPasswordController, obscureText: true, icon: Icons.lock),
              const SizedBox(height: 16),
              _buildTextField("تأكيد كلمة المرور الجديدة", _confirmNewPasswordController, obscureText: true, icon: Icons.lock),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // هنا يتم إضافة الكود لتغيير كلمة المرور
                _changePasswordSuccess(context); // استدعاء الدالة لإظهار رسالة النجاح
                Navigator.of(context).pop(); // إغلاق مربع الحوار
              },
              child: const Text("حفظ"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("إلغاء"),
            ),
          ],
        );
      },
    );
  }

  void _changePasswordSuccess(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orangeAccent,
            ),
            child: const Icon(Icons.check, color: Colors.white),
          ),
          const Text("تم تغيير كلمة المرور بنجاح"),
        ],
      ),
      backgroundColor: Colors.black87,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1D47),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFE3F2FD)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage.isNotEmpty
                            ? FileImage(File(_profileImage))
                            : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                        child: _profileImage.isEmpty
                            ? const Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                            : null,
                      ),
                      const Icon(Icons.edit, color: Color(0xFF0A1D47)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField("اسم المستخدم", _nameController),
                const SizedBox(height: 16),
                _buildTextField("البريد الإلكتروني", _emailController),
                const SizedBox(height: 16),
                _buildTextField("رقم الهاتف", _phoneController),
                const SizedBox(height: 16),
                _buildDropdownField(),
                const SizedBox(height: 16),
                Container(
                  constraints: BoxConstraints(maxWidth: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0A1D47)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _birthDate != null
                              ? "${_birthDate!.day}/${_birthDate!.month}/${_birthDate!.year}"
                              : "تاريخ الميلاد",
                          style: const TextStyle(color: Color(0xFF0A1D47)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () => _selectBirthDate(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _buildActionButton("حفظ التعديلات", const Color(0xFF0A1D47), () {
                  Navigator.pop(context);
                }),
                const SizedBox(height: 20),
                _buildActionButton("تعديل كلمة المرور", Colors.orangeAccent, () {
                  _showPasswordDialog(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false, IconData? icon}) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF0A1D47)),
          prefixIcon: icon != null ? Icon(icon, color: const Color(0xFF0A1D47)) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF0A1D47)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF0A1D47)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      constraints: BoxConstraints(maxWidth: 250),
      child: DropdownButtonFormField<String>(
        value: _gender.isEmpty ? null : _gender,
        items: ['Male', 'Female'].map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: "اختر الجنس",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF0A1D47)),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        ),
        onChanged: (value) {
          setState(() {
            _gender = value!;
          });
        },
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
        ),
        child: Text(text),
      ),
    );
  }
}