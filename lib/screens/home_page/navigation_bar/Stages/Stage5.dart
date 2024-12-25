import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants.dart';
import 'LaunchAndGrowthDetails.dart';
import 'PlanningDetails.dart';
import 'Stage4.dart';

class LaunchAndGrowthScreen extends StatefulWidget {
  const LaunchAndGrowthScreen({super.key});

  @override
  _LaunchAndGrowthScreenState createState() => _LaunchAndGrowthScreenState();
}

class _LaunchAndGrowthScreenState extends State<LaunchAndGrowthScreen> {

  final List<bool> _isChecked = [false, false, false,false];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildIdeaStudySection(), // إضافة قسم دراسة الفكرة
          ],
        ),
      ),
    );
  }


  Widget _buildIdeaStudySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة على اليسار
          Image.asset(
            'assets/images/Stage5.jpg',
            width: 500,
            height: 500,
          ),
          // النص على اليمين
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'مرحلة الإطلاق والنمو',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                ':المهام المطلوب انجازها',
                style: GoogleFonts.poppins(fontSize: 24),
              ),
              const SizedBox(height: 8),
              _buildTaskCard('إطلاق المنتج', 'طرح المنتج في السوق بشكل رسمي', 0),
              const SizedBox(height: 8),
              _buildTaskCard('مراقبة وقياس الأداء', 'متابعة أداء المنتج في السوق وقياس النتائج', 1),
              const SizedBox(height: 8),
              _buildTaskCard('التعديل إذا لزم الأمر', 'إجراء تغييرات على المنتج أو الاستراتيجية بناءً على الملاحظات والنتائج', 2),
              const SizedBox(height: 8),
              _buildTaskCard('النمو والتوسع', 'العمل على توسيع نطاق المشروع وزيادة حجم الأعمال', 3),
              const SizedBox(height: 8),
              const SizedBox(height: 20),
              // زر المعلومات الإضافية
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LaunchAndGrowthDetailsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  iconColor:kPrimaryColor, // اللون البرتقالي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // زوايا دائرية
                  ),
                  minimumSize: Size(150, 40), // عرض صغير
                ),
                child: Text('معلومات أكثر عن الإطلاق والنمو '),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // توسيط الأزرار
                children: [

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamFormationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent, // اللون البرتقالي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // زوايا دائرية
                      ),
                      minimumSize: Size(150, 40), // عرض صغير
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
                      children: [
                        Text('المرحلة السابقة', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 8), // مسافة بين الأيقونة والنص
                        Icon(Icons.arrow_forward, color: Colors.white), // رمز السهم إلى اليمين
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10), // مسافة بين الأزرار
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildTaskCard(String title, String description, int index) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked[index] = !_isChecked[index];
                  });
                },
                child: Icon(
                  _isChecked[index] ? Icons.check_box : Icons.check_box_outline_blank,
                  color: _isChecked[index] ? Colors.orangeAccent : Colors.grey,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ],
      ),
    );
  }

}