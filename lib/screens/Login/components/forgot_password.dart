import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'Otp_Verification_Screen.dart'; // تأكد من استيراد الشاشة الصحيحة

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // تغيير لون الأيقونة إلى الأبيض
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // إضافة الصورة هنا
              Image.asset(
                'assets/images/email.PNG', // استبدل بمسار الصورة الخاص بك
                width: 300, // يمكنك تعديل العرض حسب الحاجة
                height: 300, // يمكنك تعديل الارتفاع حسب الحاجة
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "أدخل بريدك الإلكتروني لارسال رمز لإعادة تعيين كلمة المرور",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الحقل هنا
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "البريد الإلكتروني",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  onSaved: (email) {
                    // هنا يمكنك إضافة الكود للتعامل مع البريد الإلكتروني المدخل
                  },
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الزر هنا
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكنك إضافة الكود لبدء عملية استعادة كلمة المرور
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpVerificationScreen(),
                      ),
                    );
                  },
                  child: const Text("أرسل "),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}