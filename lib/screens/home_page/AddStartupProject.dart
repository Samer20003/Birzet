import 'package:flutter/material.dart';

import '../../constants.dart';
import 'AddAdditionaIinformation.dart';
import 'MyStartupProjects.dart';

class AddStartupProjectScreen extends StatelessWidget {
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
                  'إضافة مشروع ناشئ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
                Text(
                  'تنويه: جميع الحقول مطلوبة حتى يتم نشر المشروع',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
                _buildLabeledTextField('اسم المشروع'),
                SizedBox(height: 10),
                _buildLabeledTextField('شرح مبسط عن المشروع', maxLength: 140, maxLines: 3),
                SizedBox(height: 10),
                Text('ما هو مجال المشروع', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                _buildDropdownField(),
                SizedBox(height: 10),
                _buildLabeledTextField('ملخص عن المشروع', maxLines: 5, maxLength: 2000),
                SizedBox(height: 10),
                _buildLabeledTextField('الإيميل'),
                SizedBox(height: 10),
                Text(
                  '*هذا الحقل خاص ولا يظهر للعام',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20),
                _buildVisibilityDropdown(), // New visibility dropdown
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyStartupProjectsScreen()),
                          );
                        },
                        child: Text('إلغاء'),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddAdditionaIinformationScreen()),
                              );
                            },
                            child: Text('حفظ و متابعة'),
                          ),
                        ),
                        SizedBox(width: 10),
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
            color: Colors.white, // تغيير لون الحقل الداخلي
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

  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 8),
        Container(
          width: 700,
          color: Colors.white, // تغيير لون الحقل الداخلي
          child: DropdownButtonFormField<String>(
            items: [
              'تعليمي',
              'تواصل اجتماعي',
              'التواصل والإعلام',
              'تجارة إلكترونية',
              'مالي وخدمات الدفع',
              'موسيقى وترفيه',
              'أمن إلكتروني',
              'الصحة',
              'نقل وتوصيل',
              'تصنيع',
              'منصة إعلانية',
              'تسويق إلكتروني',
              'محتوى',
              'الزراعة',
              'خدمات إعلانية',
              'انترنت الأشياء',
              'الملابس',
              'الطاقة',
              'الأطفال',
              'البرنامج كخدمة',
              'ذكاء اصطناعي',
              'تعليم الآلة',
              'خدمات منزلية',
              'ألعاب',
              'التمويل الجماعي',
              'هدايا',
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
          ),
        ),
      ],
    );
  }

  Widget _buildVisibilityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('هل ترغب في جعل المشروع خاصًا أم عامًا؟', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          width: 700,
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            items: [
              DropdownMenuItem<String>(
                value: 'خاص',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('خاص'),
                ),
              ),
              DropdownMenuItem<String>(
                value: 'عام',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('عام'),
                ),
              ),
            ],
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}