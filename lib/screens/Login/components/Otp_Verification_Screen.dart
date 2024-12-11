import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'Reset_Password_Screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                'assets/images/code1.PNG', // استبدل بمسار الصورة الخاص بك
                width: 300, // يمكنك تعديل العرض حسب الحاجة
                height: 300, // يمكنك تعديل الارتفاع حسب الحاجة
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "أدخل رمز التحقق الذي أرسل إلى بريدك الإلكتروني",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الحقل هنا
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "الرمز",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onSaved: (otp) {
                    // هنا يمكنك إضافة كود للتحقق من OTP
                  },
                ),
              ),
              const SizedBox(height: defaultPadding),
              Container(
                width: 300, // تحديد عرض الزر هنا
                child: ElevatedButton(
                  onPressed: () {
                    // هنا يمكنك إضافة الكود للتحقق من OTP
                    // إذا كان OTP صحيحًا، انتقل إلى شاشة إعادة تعيين كلمة المرور
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text("تحقق"),
                ),
              ),
              TextButton(
                onPressed: () {
                  // هنا يمكنك إضافة الكود لإعادة إرسال OTP
                  print("إعادة إرسال الرمز");
                },
                child: const Text("إعادة إرسال الرمز"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}