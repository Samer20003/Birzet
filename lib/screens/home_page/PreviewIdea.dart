import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Activity.dart';
import 'MyAccount.dart';
import 'MyIdeas.dart';
import 'MyInvestments.dart';
import 'MyStartupProjects.dart';

class PreviewIdeaScreen extends StatefulWidget {
  @override
  _PreviewIdeaScreenState createState() => _PreviewIdeaScreenState();
}

class _PreviewIdeaScreenState extends State<PreviewIdeaScreen> {
  String _profileImage = ''; // متغير لتخزين مسار الصورة
  String _displayedText = ''; // المتغير لتخزين النص المعروض
  String? _displayedImagePath; // المتغير لتخزين مسار الصورة المعروضة

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = image.path; // تحديث مسار الصورة
      });
    }
  }

  void _updateContent(String title, {String? imagePath}) {
    setState(() {
      _displayedText = title;
      _displayedImagePath = imagePath;
    });
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
            SizedBox(height: 20), // مسافة بين العنوان والإشعارات

            // **إضافة مربع المشروع**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع العناصر بالتساوي
              children: [
                // المستطيل الجديد بجانب المربع
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 10), // مسافة بين المربع والمستطيل
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 350, // إضافة ارتفاع محدد
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end, // محاذاة النص لليمين
                      children: [
                        Text(
                          'عن الفكرة ',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right, // محاذاة النص لليمين
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end, // تغيير المحاذاة لتقليل الفراغ
                          children: [
                            GestureDetector(
                              onTap: () {
                                _updateContent("هذه هي الملاحظات.");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0), // تقليل الهوامش
                                child: Text('الملاحظات', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ),


                            GestureDetector(
                              onTap: () {
                                _updateContent("هذا هو النص الخاص بسير الفكرة .");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0), // تقليل الهوامش
                                child: Text('سير الفكرة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _updateContent("هذا هو النص الخاص بالصفحة حول.");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0), // تقليل الهوامش
                                child: Text('حول', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20), // مسافة بين العبارات
                        // عرض المحتوى المعروض
                        _displayedImagePath != null
                            ? Image.asset(_displayedImagePath!)
                            : Text(_displayedText, textAlign: TextAlign.right),
                      ],
                    ),
                  ),
                ),

                // المربع الحالي
                Container(
                  width: 250,
                  height: 350,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10, left: 20), // ترك مساحة 10 بكسل
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/D2.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'اسم الفكرة',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'نوع الفكرة',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 150,
                        height: 2,
                        color: Color(0xFFE0E0E0),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'وصف مختصر', // تغيير النص إلى وصف مختصر
                        style: TextStyle(fontSize: 14, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 100), // يمكنك تغيير القيمة حسب الحاجة
          ],
        ),
      ),
    );
  }
}