import 'package:flutter/material.dart';
import 'package:ggg_hhh/screens/home_page/navigation_bar/home_page_screen.dart';
import '../../../constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureTextNewPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // تغيير لون الأيقونة إلى الأبيض
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // أيقونة السهم الدائري
          onPressed: () {
            Navigator.pop(context); // العودة إلى الصفحة السابقة
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // إضافة الصورة هنا
              Image.asset(
                'assets/images/forgotpassword.PNG', // استبدل بمسار الصورة الخاص بك
                width: 300, // عرض الصورة
                height: 300, // ارتفاع الصورة
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "أدخل كلمة المرور الجديدة",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الحقل هنا
                child: TextFormField(
                  obscureText: _obscureTextNewPassword,
                  decoration: InputDecoration(
                    hintText: "كلمة المرور الجديدة",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextNewPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextNewPassword = !_obscureTextNewPassword; // تبديل الحالة
                        });
                      },
                    ),
                  ),
                  onSaved: (newPassword) {
                    // هنا يمكنك حفظ كلمة المرور الجديدة
                  },
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الحقل هنا
                child: TextFormField(
                  obscureText: _obscureTextConfirmPassword,
                  decoration: InputDecoration(
                    hintText: "تأكيد كلمة المرور",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextConfirmPassword = !_obscureTextConfirmPassword; // تبديل الحالة
                        });
                      },
                    ),
                  ),
                  onSaved: (confirmPassword) {
                    // هنا يمكنك إضافة كود للتحقق من تطابق كلمتين المرور
                  },
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الزر هنا
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكنك إضافة الكود لتحديث كلمة المرور
                    _showSuccessDialog(context);
                  },
                  child: const Text("تحديث كلمة المرور"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // منع إغلاق مربع الحوار عند الضغط في أي مكان آخر
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // إضافة صورة صغيرة فوق النص
              Image.asset(
                'assets/images/like.PNG', // استبدل بمسار الصورة الخاص بك
                width: 200, // عرض الصورة
                height: 200, // ارتفاع الصورة
              ),
              const SizedBox(height: 10), // مسافة بين الصورة والنص
              const Text(
                "تم إعادة تعيين كلمة المرور بنجاح.",
                style: TextStyle(color: Colors.black), // لون النص
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white, // لون النص
              ),
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
                style: TextStyle(color: Colors.blue), // لون النص
              ),
            ),
          ],
        );
      },
    );
  }
}