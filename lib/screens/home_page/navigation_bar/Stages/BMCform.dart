import 'package:flutter/material.dart';
import '../../../../constants.dart'; // تأكد من استيراد ملف الثوابت

class BMCformscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Model Canvas',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor, // استخدام الكحلي
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: BusinessModelCanvas(),
        ),
      ),
    );
  }
}

class BusinessModelCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.grey[200], // اللون السكني
        border: Border.all(color: kPrimaryColor, width: 2), // الحدود باللون الكحلي
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2, // ثلثين للقسم العلوي
            child: Row(
              children: [
                Expanded(
                  child: _buildSection('الشركاء الرئيسيون\n(Key Partners)', Icons.group),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildSection('الأنشطة الرئيسية\n(Key Activities)', Icons.work),
                      ),
                      Expanded(
                        child: _buildSection('الموارد الرئيسية\n(Key Resources)', Icons.storage),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildSection('قيمة العرض\n(Value Propositions)', Icons.star),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildSection('علاقات العملاء\n(Customer Relationships)', Icons.chat),
                      ),
                      Expanded(
                        child: _buildSection('القنوات\n(Channels)', Icons.local_shipping),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildSection('شرائح العملاء\n(Customer Segments)', Icons.people),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1, // ثلث للقسم السفلي
            child: Row(
              children: [
                Expanded(
                  child: _buildSection('هيكل التكاليف\n(Cost Structure)', Icons.money),
                ),
                Expanded(
                  child: _buildSection('مصادر الإيرادات\n(Revenue Streams)', Icons.attach_money),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor), // حدود القسم باللون الكحلي
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // لمحاذاة النص إلى الأعلى
        children: [
          SizedBox(height: 8), // مسافة بين العنوان والأيقونة
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // لمحاذاة الأيقونة والنص إلى اليمين
            children: [
              Icon(
                icon,
                size: 24, // حجم الأيقونة
                color: kPrimaryColor, // لون الأيقونة
              ),
              SizedBox(width: 8), // مسافة بين الأيقونة والعنوان
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // خط أصغر
                  textAlign: TextAlign.right, // محاذاة النص إلى اليمين
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'محتوى القسم هنا', // يمكنك إضافة محتوى القسم هنا
                style: TextStyle(fontSize: 12), // خط أصغر لمحتوى القسم
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}