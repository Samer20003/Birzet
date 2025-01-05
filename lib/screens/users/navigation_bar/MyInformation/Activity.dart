import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'MyIdeas/MyIdeas.dart';
import 'MyStartupProjects/MyStartupProjects.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  String _profileImage = ''; // متغير لتخزين مسار الصورة
  bool _showMessenger = false; // متغير للتحكم في عرض صفحة المحادثات

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image.path; // تحديث مسار الصورة
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A1D47),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // المستطيل العلوي باللون الكحلي
            Container(
              color: Color(0xFF0A1D47),
              height: 30,
            ),
            // المستطيل الأبيض يحتوي على صورة الحساب واسم الشخص
            Container(
              color: Colors.grey[200], // لون رمادي
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اسم الشخص',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: _profileImage.isNotEmpty
                              ? FileImage(File(_profileImage))
                              : const AssetImage('assets/images/defaultpfp.jpg') as ImageProvider,
                          child: _profileImage.isEmpty
                              ? const Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                              : null,
                        ),
                        const Icon(Icons.edit, color: Color(0xFF0A1D47)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // خط أفقي بين المستطيلين
            Container(
              height: 2,
              color: Color(0xFF0A1D47),
            ),
            // المستطيل الثاني باللون السكني بدون أيقونات
            Container(
              color: Colors.grey[200], // لون رمادي
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavButton('سجل النشاطات', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityScreen()), // زر سجل النشاطات
                    );
                  }),
                  _buildNavButton('أفكاري', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyIdeasScreen()), // زر أفكاري
                    );
                  }),
                  _buildNavButton('مشاريعي الناشئة', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyStartupProjectsScreen()), // زر مشاريعي الناشئة
                    );
                  }),
                  _buildNavButton('حسابي', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyStartupProjectsScreen()), // زر حسابي
                    );
                  }),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Color(0xFF0A1D47),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight, // محاذاة العنوان لليمين
              margin: EdgeInsets.only(right: 80.0), // بعد 80 بكسل من الجهة اليمنى
              child: Text(
                'سجل النشاطات',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 20), // مسافة بين العنوان والإشعارات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Column(
                children: [
                  _buildNotificationCard('تم تحديث مشروعك', '2024-12-01 10:00', Colors.grey[300]),
                  _buildNotificationCard('تم إضافة فكرة جديدة', '2024-12-01 11:00', Colors.white),
                  _buildNotificationCard('تم تغيير حالة مشروعك', '2024-12-01 12:00', Colors.grey[300]),
                  _buildNotificationCard('لديك رسالة جديدة', '2024-12-01 13:00', Colors.white),
                  _buildNotificationCard('تم دعوة شخص للانضمام', '2024-12-01 14:00', Colors.grey[300]),
                ],
              ),
            ),
            SizedBox(height: 20), // مساحة فارغة في نهاية الصفحة
            SizedBox(height: 40), // مساحة فارغة في النهاية
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Text(title, style: TextStyle(color: Color(0xFF001F3F))),
      ),
    );
  }

  Widget _buildNotificationCard(String message, String time, Color? color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200]!,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust the main axis alignment
        children: [
          // Align time to the left
          Text(
            time,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(width: 10),
          // Align message to the right
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                message,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}