import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import '../../constants.dart';
import 'AddStartupProject.dart';
import 'MyStartupProjects.dart';

class AddAdditionaIinformationScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // هنا يمكنك استخدام الصورة المختارة، مثل تخزينها أو عرضها
      // يمكنك استخدام `setState` أو أي طريقة لإدارة الحالة حسب الحاجة
      print('تم اختيار الصورة: ${image.path}');
      // مثال على عرض الصورة (إذا كان لديك StatefulWidget)
      // setState(() {
      //   _selectedImagePath = image.path;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor, // استخدام اللون المخصص
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'معلومات إضافية عن مشروعي',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
                _buildLabeledTextField('الموقع الإلكتروني'),
                SizedBox(height: 30), // فراغ بين النص والمستطيل
                Text('تاريخ إنشاء المشروع', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10), // فراغ بين النص والمستطيل
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      child: _buildYearDropdown(),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      child: _buildMonthDropdown(),
                    ),
                  ],
                ),
                SizedBox(height: 30), // فراغ بين النص والمستطيل
                Text('أضف صورة لمشروعك', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10), // فراغ بين النص والمستطيل
                _buildImageUploadField(context),
                SizedBox(height: 30), // فراغ بين النص والمستطيل
                Text('نموذج العمل كصورة', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10), // فراغ بين النص والمستطيل
                _buildWorkModelUploadField(context),
                SizedBox(height: 30), // فراغ بين النص والمستطيل
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddStartupProjectScreen()),
                          );                        },
                        child: Text('إلغاء'),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyStartupProjectsScreen()),
                          );
                        },
                        child: Text('حفظ و نشر'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, {int maxLines = 1, int? maxLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            maxLines: maxLines,
            maxLength: maxLength,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              counterText: '',
            ),
          ),
        ),
        if (maxLength != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('0/$maxLength', style: TextStyle(color: Colors.grey)),
            ),
          ),
      ],
    );
  }

  Widget _buildYearDropdown() {
    return DropdownButtonFormField<String>(
      items: List.generate(50, (index) {
        int year = DateTime.now().year - index;
        return DropdownMenuItem<String>(
          value: year.toString(),
          child: Text(year.toString()),
        );
      }),
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return DropdownButtonFormField<String>(
      items: [
        'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
        'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildImageUploadField(BuildContext context) {
    return Container(
      width: 700,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.add_a_photo, size: 50, color: kPrimaryColor),
          onPressed: () => _pickImage(context),
        ),
      ),
    );
  }

  Widget _buildWorkModelUploadField(BuildContext context) {
    return Container(
      width: 700,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.add_a_photo, size: 50, color: kPrimaryColor),
          onPressed: () => _pickImage(context),
        ),
      ),
    );
  }
}