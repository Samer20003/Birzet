import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants.dart';
import 'CreateBusinessPlan.dart';
import 'PlanningDetails.dart';
import 'Stage1.dart';
import 'Stage3.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  final List<bool> _isChecked = List<bool>.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
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
            const SizedBox(height: 40),
            _buildIdeaStudySection(),
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
          Container(
            width: 500, // Adjusted width for better layout
            height: 500,
            child: Image.asset(
              'assets/images/Stage2.jpg',
              fit: BoxFit.cover, // ملاءمة الصورة
            ),
          ),
          // النص على اليمين
          Expanded( // استخدام Expanded للسماح بالتوزيع المناسب
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'مرحلة التحقق والتخطيط',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'التحقق من صحة الفكرة -',
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 20),
                _buildTaskCard(
                  'تشكيل فرضيات أساسية',
                  'حول من هم عملاؤك المستهدفون، والمشكلات التي يواجهونها، وكيف يمكن لمنتجك أو خدمتك حل هذه المشكلات',
                  0,
                ),
                const SizedBox(height: 8),
                _buildTaskCard(
                  'اجمع المعلومات الداعمة',
                  'استخدم التقارير والدراسات الصناعية لدعم فرضياتك، وفكر في إجراء استطلاعات الرأي والمقابلات ومجموعات التركيز مع جمهورك المستهدف.',
                  1,
                ),
                const SizedBox(height: 20),
                Text(
                  'إنشاء خطة العمل -',
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                _buildTask(
                  'قم بانشاء خطة العمل',
                  'إذا لم يكن لديك نموذج عمل بعد، فلا تقلق! دعنا نساعدك في بناء نموذج عمل متميز يحقق أهدافك.',
                  2,
                ),
                const SizedBox(height: 40),
                Text(
                  'سجل عملك -',
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8),
                _buildChecklist(),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanningDetailsScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(150, 40),
                  ),
                  child: Text('معلومات أكثر عن التحقق والتخطيط'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudyTheIdeaScreen()),
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
                      label: Text('المرحلة السابقة', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FinancingScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(150, 40),
                      ),
                      icon: Icon(Icons.arrow_forward, color: Colors.white),
                      label: Text('المرحلة التالية', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTask(String title, String description, int index) {
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
          const SizedBox(height: 12), // فراغ قبل الزر
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateBusinessPlanScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              iconColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(150, 40),
            ),
            child: Text('إنشاء نموذج العمل التجاري (BMC)'),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklist() {
    return Column(
      children: [
        _buildTaskCard(
          'اختيار اسم لشركتك الناشئة؛',
          'يجب أن يكون الاسم فريدًا وسهل التذكر ويتوافق مع القوانين المحلية.',
          2,
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
          'الحصول على رقم تعريف صاحب العمل',
          'يعد هذا ضروريًا لتوظيف الموظفين وفتح حسابات مصرفية تجارية ودفع الضرائب.',
          3,
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
          'تسجيل عملك لدى الدولة',
          'تسجيل العمل يوفر لك الحماية القانونية ويحتم عليك الحصول على التراخيص اللازمة.',
          4,
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
          'فتح حساب بنكي تجاري',
          'يفصل الحساب أموالك الشخصية عن أموال العمل ويسهل إدارة المعاملات المالية.',
          5,
        ),
        const SizedBox(height: 8),
        _buildTaskCard(
          'تأمين التأمين.',
          'التأمين يحمي عملك من المخاطر المحتملة ويعزز ثقة العملاء في خدماتك.',
          6,
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