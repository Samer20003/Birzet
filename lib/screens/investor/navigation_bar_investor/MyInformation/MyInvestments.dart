import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Activity.dart';
import 'MyAccount.dart';

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
            Container(
              color: Color(0xFF0A1D47),
              height: 30,
            ),
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
            Container(
              height: 2,
              color: Color(0xFF0A1D47),
            ),
            Container(
              color: Colors.grey[200], // لون رمادي
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavButton(context, 'سجل النشاطات', MyInvestmentsScreen()),
                  _buildNavButton(context, 'استثماراتي', ActivityScreen()),
                  _buildNavButton(context, 'حسابي', ProfileScreeninvestor()),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Color(0xFF0A1D47),
            ),
            SizedBox(height: 20),

            // عنوان الجداول
            Text(
              'الاستثمارات الحالية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10),

            // عرض جدول الاستثمارات الحالية
            _buildCurrentInvestmentsTable(),

            SizedBox(height: 20),

            // عنوان طلبات الاستثمار
            Text(
              'طلبات الاستثمار',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 10),

            // عرض جدول طلبات الاستثمار
            _buildInvestmentRequestsTable(),

            SizedBox(height: 40), // مساحة فارغة في نهاية الصفحة
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
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

  Widget _buildCurrentInvestmentsTable() {
    return Container(
      padding: EdgeInsets.all(10),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('إجراءات', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('حالة الاستثمار', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نموذج الطلب', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نموذج الاستثمار', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('اسم المشروع', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // منطق تعديل
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // منطق حذف
                  },
                ),
              ],
            )),
            DataCell(Text('نشط')),
            DataCell(_buildButton('طلب 1', () {
              // منطق نموذج الطلب
            })),
            DataCell(_buildButton('نموذج 1', () {
              // منطق نموذج الاستثمار
            })),
            DataCell(Text('مشروع 1')),
          ]),
          DataRow(cells: [
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // منطق تعديل
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // منطق حذف
                  },
                ),
              ],
            )),
            DataCell(Text('مغلق')),
            DataCell(_buildButton('طلب 2', () {
              // منطق نموذج الطلب
            })),
            DataCell(_buildButton('نموذج 2', () {
              // منطق نموذج الاستثمار
            })),
            DataCell(Text('مشروع 2')),
          ]),
        ],
      ),
    );
  }

  Widget _buildInvestmentRequestsTable() {
    return Container(
      padding: EdgeInsets.all(10),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('إجراءات', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نموذج الطلب', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('نموذج الاستثمار', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('اسم المشروع', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // منطق حذف
                  },
                ),
              ],
            )),

            DataCell(_buildButton('طلب A', () {
              // منطق نموذج الطلب
            })),
            DataCell(_buildButton('نموذج A', () {
              // منطق نموذج الاستثمار
            })),
            DataCell(Text('مشروع A')),
          ]),
          DataRow(cells: [
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // منطق حذف
                  },
                ),
              ],
            )),

            DataCell(_buildButton('طلب B', () {
              // منطق نموذج الطلب
            })),
            DataCell(_buildButton('نموذج B', () {
              // منطق نموذج الاستثمار
            })),
            DataCell(Text('مشروع B')),
          ]),
        ],
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback onPressed) {
    return Container(
      width: 120,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0A1D47),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // زوايا دائرية
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}