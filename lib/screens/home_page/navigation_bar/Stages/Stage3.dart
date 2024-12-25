import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';
import 'FinancingDetails.dart';
import 'IdeaStudyDetails.dart';
import 'Stage2.dart';
import 'Stage4.dart';

class FinancingScreen extends StatefulWidget {
  const FinancingScreen({super.key});

  @override
  _FinancingScreenState createState() => _FinancingScreenState();
}

class _FinancingScreenState extends State<FinancingScreen> {

  final List<bool> _isChecked = List<bool>.filled(7, false);

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
          Image.asset(
            'assets/images/Stage3.jpg',
            width: 500,
            height: 500,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'التمويل والتأمين',
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

              // New text added here
              Text(
                'اتخاذ قرار بشأن تمويل مشروعك الناشئ -',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold), // Largest font
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 8),

              _buildTaskCard('تحديد تمويل المشروع', 'اتخاذ قرار بشأن كيفية تمويل المشروع، سواء من خلال مستثمرين أو قروض..', 0),
              const SizedBox(height: 8),
              _buildTaskCard('جذب المستثمرين ', 'عرض تقديمي مثير للإعجاب يتضمن المشكلة التي يحلها عملك، وكيف يكون الحل الذي تقدمه فريدًا، وكيف تخطط لكسب المال، ومقدار التمويل الذي تحتاجه بالضبط ولماذا، وكيف سيحصل المستثمرون على عائد على استثماراتهم.', 1),
              const SizedBox(height: 8),

              // Existing section for budget plan
              Column(
                crossAxisAlignment: CrossAxisAlignment.end, // Align text to the right
                children: [
                  Text(
                    'انشاء خطة الميزانية -',
                    style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold), // Largest font
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 4), // Space between lines
                  Text(
                    'لكي تتمكن من التخطيط لأنشطتك المستقبلية بشكل فعال',
                    style: GoogleFonts.poppins(fontSize: 20), // Medium font size
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 4), // Space between lines
                  Text(
                    'اتبع الخطوات التالية لإنشاء خطة مالية واقعية',
                    style: GoogleFonts.poppins(fontSize: 16), // Smallest font size
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Call to the checklist method
              _buildChecklist(),

              const SizedBox(height: 20),
              // Button for additional information
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinancingDetailsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  iconColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(150, 40),
                ),
                child: Text('معلومات أكثر عن التمويل والتأمين'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeamFormationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(150, 40),
                    ),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    label: Text('المرحلة التالية', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlanningScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(150, 40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('المرحلة السابقة', style: TextStyle(color: Colors.white)),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50), // اضبط الارتفاع حسب الحاجة
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChecklist() {
    return Column(
      children: [
        _buildTaskCard(
            'التكاليف', // Add a description here
            'تقدير التكاليف الأولية، مثل الرسوم القانونية، والإيجار، والمرافق، وتكاليف إعداد أنظمة تكنولوجيا المعلومات، وتطوير المنتجات، والتسويق',

            2
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
            ' مصاريف التشغيل',
            'مصاريف تشغيل المشروع، بما في ذلك رواتب الموظفين والمدفوعات مقابل الخدمات الخارجية، بالإضافة إلى التكاليف المستمرة للحفاظ على استمرارية عملك',

            3
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
            'الإيرادات',
            'توقع الإيرادات. استخدم أبحاث السوق الخاصة بك لتكوين تخمين مدروس حول المبيعات المستقبلية',

            4
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
            'البيانات المالية',
            'إنشاء البيانات المالية، بما في ذلك بيان الدخل، والميزانية العمومية، وبيان التدفق النقدي',

            5
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
            ' صندوق الطوارئ',
            'من المستحسن أن تدرج في ميزانيتك صندوق طوارئ بنسبة تتراوح بين 10% إلى 20%',

            6
        ),
      ],
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