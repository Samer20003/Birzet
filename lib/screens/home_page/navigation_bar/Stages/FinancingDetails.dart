import 'package:flutter/material.dart';

import '../../../../constants.dart';

class FinancingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor, // استخدام اللون المخصص
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // السهم باللون الأبيض
          onPressed: () {
            Navigator.pop(context); // العودة إلى الصفحة السابقة
          },
        ),
      ),
      body: Center(
        child: Text(
          'محتوى الصفحة هنا.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}