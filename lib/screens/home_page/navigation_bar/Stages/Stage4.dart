import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants.dart';
import 'PlanningDetails.dart';
import 'Stage3.dart';
import 'Stage5.dart';
import 'TeamFormationDetails.dart';

class TeamFormationScreen extends StatefulWidget {
  const TeamFormationScreen({super.key});

  @override
  _TeamFormationScreenState createState() => _TeamFormationScreenState();
}

class _TeamFormationScreenState extends State<TeamFormationScreen> {

  final List<bool> _isChecked = [false, false, false];

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
            'assets/images/Stage4.jpg',
            width: 500,
            height: 500,
          ),
          // النص على اليمين
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'مرحلة تأسيس الفريق والموارد ',
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
              _buildTaskCard('تكوين الفريق', 'بناء فريق عمل يتكون من الأشخاص ذوي المهارات المناسبة', 0),
              const SizedBox(height: 8),
              _buildTaskCard('إنشاء نموذج أولي (MVP)', 'تطوير إصدار أولي من المنتج لاختبار الفكرة في السوق', 1),
              const SizedBox(height: 8),
              _buildTaskCard('إنشاء استراتيجية تسويقية', 'وضع خطة تسويقية لجذب العملاء والترويج للمنتج', 2),
              const SizedBox(height: 20),
              // زر المعلومات الإضافية
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeamFormationDetailsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  iconColor:kPrimaryColor, // اللون البرتقالي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // زوايا دائرية
                  ),
                  minimumSize: Size(150, 40), // عرض صغير
                ),
                child: Text('معلومات أكثر عن تأسيس الفريق والموارد'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // توسيط الأزرار
                children: [

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LaunchAndGrowthScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent, // اللون البرتقالي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // زوايا دائرية
                      ),
                      minimumSize: Size(150, 40), // عرض صغير
                    ),
                    icon: Icon(Icons.arrow_back, color: Colors.white), // رمز السهم إلى اليسار
                    label: Text('المرحلة التالية', style: TextStyle(color: Colors.white)),
                  ),

                  const SizedBox(width: 20), // مسافة بين الأزرار

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinancingScreen()),
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