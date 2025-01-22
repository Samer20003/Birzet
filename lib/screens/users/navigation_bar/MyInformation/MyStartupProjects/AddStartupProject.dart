import 'dart:io'; // Import for File handling
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picking
import '../../../../../constants.dart';
import 'CreateBusinessPlan.dart';
import 'MyStartupProjects.dart';

class AddStartupProjectScreen extends StatefulWidget {
  @override
  _AddStartupProjectScreenState createState() => _AddStartupProjectScreenState();
}

class _AddStartupProjectScreenState extends State<AddStartupProjectScreen> {
  String? selectedCity; // متغير لتخزين المدينة المختارة
  final ImagePicker _picker = ImagePicker();
  String? imagePath; // Variable to hold the selected image path
  final TextEditingController _shortDescriptionController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _challengesController = TextEditingController(); // New controller for challenges
  int shortDescriptionLength = 0;
  int summaryLength = 0;

  @override
  void initState() {
    super.initState();
    _shortDescriptionController.addListener(() {
      setState(() {
        shortDescriptionLength = _shortDescriptionController.text.length;
      });
    });
    _summaryController.addListener(() {
      setState(() {
        summaryLength = _summaryController.text.length;
      });
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path; // Store the selected image path
      });
      print('تم اختيار الصورة: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
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
                Text('ما هو مجال المشروع', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                _buildDropdownField(),
                SizedBox(height: 10),
                Text('تاريخ إنشاء المشروع', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(width: 120, child: _buildYearDropdown()),
                    SizedBox(width: 10),
                    Container(width: 120, child: _buildMonthDropdown()),
                  ],
                ),
                SizedBox(height: 10),
                // إضافة Dropdown للمدن
                Text('اختر المدينة', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                _buildCityDropdown(),
                SizedBox(height: 10),
                SizedBox(height: 20),
                // New section for end date
                Text('المرحلة الحالية للمشروع', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                _buildStageDropdownField(),
                SizedBox(height: 10),
                SizedBox(height: 30),
                _buildLabeledTextField('شرح مبسط عن المشروع', maxLength: 140, maxLines: 3, controller: _shortDescriptionController),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('$shortDescriptionLength/140', style: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 20),
                _buildLabeledTextField('الموقع الإلكتروني'),
                SizedBox(height: 30),
                _buildLabeledTextField('الإيميل'),
                SizedBox(height: 20),
                Text('أضف صورة لمشروعك', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildImageUploadField(),
                SizedBox(height: 30),
                // New section for challenges
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('${_challengesController.text.length}/200', style: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 30),

                _buildVisibilityDropdown(),
                _buildLabeledTextField('ملخص عن المشروع', maxLines: 5, maxLength: 2000, controller: _summaryController),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('$summaryLength/2000', style: TextStyle(color: Colors.grey)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('إلغاء'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align buttons with space between
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            child: Text('حفظ'),
                          ),
                        ),
                        SizedBox(width: 10), // Space between the buttons
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateBusinessPlanScreen()),
                              );
                            },
                            child: Text('التالي'),
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
  Widget _buildCityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 8),
        Container(
          width: 700,
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            value: selectedCity,
            items: [
              'نابلس',
              'جنين',
              'قلقيلية',
              'رام الله',
              'طولكرم',
            ].map((String city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCity = value; // تخزين المدينة المختارة
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLabeledTextField(String label, {int maxLines = 1, int? maxLength, TextEditingController? controller}) {
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
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLength,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              counterText: '', // Hide default counter
            ),
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
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            items: [
              'تعليمي',
              'تواصل اجتماعي',
              'تواصل وإعلام',
              'تجارة إلكترونية',
              'مالي وخدمات الدفع',
              'موسيقى وترفيه',
              'أمن إلكتروني',
              'صحة',
              'نقل وتوصيل',
              'تصنيع',
              'منصة إعلانية',
              'تسويق إلكتروني',
              'محتوى',
              'زراعة',
              'خدمات إعلانية',
              'إنترنت الأشياء',
              'ملابس',
              'طاقة',
              'أطفال',
              'برنامج كخدمة (SaaS)',
              'ذكاء اصطناعي',
              'تعليم آلة',
              'خدمات منزلية',
              'ألعاب',
              'تمويل جماعي',
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

  Widget _buildStageDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 8),
        Container(
          width: 700,
          color: Colors.white,
          child: DropdownButtonFormField<String>(
            items: [
              'مرحلة دراسة الفكرة',
              'مرحلة التحقق والتخطيط ',
              'مرحلة التمويل والتأمين',
              'مرحلة تأسيس الفريق والموارد',
              'مرحلة الإطلاق والنمو',
            ].map((String stage) {
              return DropdownMenuItem<String>(
                value: stage,
                child: Text(stage),
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

  Widget _buildYearDropdown() {
    return DropdownButtonFormField<String>(
      items: List.generate(30, (index) {
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
        'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو', 'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
      ].map((String month) {
        return DropdownMenuItem<String>(
          value: month,
          child: Text(month),
        );
      }).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildImageUploadField() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Background color for the square
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: imagePath == null
            ? Center(
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey,
            size: 50,
          ),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            File(imagePath!), // Display the selected image
            fit: BoxFit.cover,
          ),
        ),
      ),
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