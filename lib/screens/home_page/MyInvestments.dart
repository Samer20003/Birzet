import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Activity.dart';
import 'MyAccount.dart';
import 'MyIdeas.dart';
import 'MyStartupProjects.dart';

class MyInvestmentsScreen extends StatefulWidget {
  @override
  _MyInvestmentsScreenState createState() => _MyInvestmentsScreenState();
}

class _MyInvestmentsScreenState extends State<MyInvestmentsScreen> {
  String _profileImage = ''; // متغير لتخزين مسار الصورة

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
                mainAxisAlignment: MainAxisAlignment.end, // محاذاة العناصر لليمين
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
                          radius: 80, // زيادة الحجم هنا
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
              height: 2, // ارتفاع الخط
              color: Color(0xFF0A1D47), // لون الخط
            ),
            // المستطيل الثاني باللون السكني بدون أيقونات
            Container(
              color: Colors.grey[200], // لون رمادي
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ActivityScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Text('سجل النشاطات', style: TextStyle(color: Color(0xFF001F3F))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyInvestmentsScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Text('استثماراتي', style: TextStyle(color: Color(0xFF001F3F))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyIdeasScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Text('أفكاري', style: TextStyle(color: Color(0xFF001F3F))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyStartupProjectsScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Text('مشاريعي الناشئة', style: TextStyle(color: Color(0xFF001F3F))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: Text('حسابي', style: TextStyle(color: Color(0xFF001F3F))),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2, // ارتفاع الخط
              color: Color(0xFF0A1D47), // لون الخط
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.centerRight, // محاذاة العنوان لليمين
              margin: EdgeInsets.only(right: 80.0), // بعد 80 بكسل من الجهة اليمنى
              child: Text(
                'استثماراتي',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 20), // مسافة بين العنوان والإشعارات

            SizedBox(height: 100), // يمكنك تغيير القيمة حسب الحاجة

          ],
        ),
      ),
    );
  }
}