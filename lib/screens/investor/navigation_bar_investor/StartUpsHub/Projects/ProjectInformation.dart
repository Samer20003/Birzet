import 'package:flutter/material.dart';
import '../../../../basic/footer.dart';
import '../../../../basic/header.dart';
import '../../../../investor/InvestmentModel.dart';
import '../../Drawerinvestor/Drawerinvestor.dart';
import '../../../../ChatForInquiries/ChatForInquiries.dart';
import '../../NavigationBarinvestor.dart';

class ProjectInformationScreen extends StatefulWidget {
  @override
  _ProjectInformationScreenState createState() => _ProjectInformationScreenState();
}

class _ProjectInformationScreenState extends State<ProjectInformationScreen> {
  Widget? _selectedContent; // تغيير إلى نوع Widget?
  int _selectedStar = 0; // لتحفظ رقم النجمة المحددة

  void _updateContent(Widget content) {
    setState(() {
      _selectedContent = content; // تعيين المحتوى كـ Widget
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0A1D47),
      ),
      drawer: Drawerinvestor(scaffoldKey: _scaffoldKey), // استدعاء Drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScreen(), // استدعاء الهيدر
            NavigationBarinvestor(
              scaffoldKey: _scaffoldKey,
              onSelectContact: (value) {
                // منطق لتحديد جهة الاتصال
              },
            ),
            const SizedBox(height: 40),
            _buildMainContent(),
            const SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }


  Widget _buildActionButton(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // إضافة وظيفة عند الضغط
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        _buildActionButton('تنزيل نموذج الاستثمار', () {
          // وظيفة تنزيل نموذج الاستثمار
        }),
        SizedBox(width: 8),
        _buildActionButton('استفسر الآن', () {
          _showChatDialog(context); // استدعاء نافذة الدردشة هنا
        }),
        SizedBox(width: 8),
        _buildActionButton('تقديم طلب استثمار', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InvestmentRequestFormScreen()),
          );
          // وظيفة تقديم طلب استثمار
        }),
        SizedBox(width: 8),
      ],
    );
  }
  void _showChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              bottom: 0, // لتحديد موقعها من الأسفل
              left: 0, // لتحديد موقعها من اليسار
              child: Container(
                width: 400,
                height: 600, // يمكنك تعديل الحجم كما تحتاج
                child: ChatForInquiriesScreen(), // استبدل هذا بالمحتوى الخاص بك
              ),
            ),
          ],
        );
      },
    );
  }


  Widget _buildMainContent() {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildProjectDetails(),
            ),
            SizedBox(width: 20),
            _buildProjectSummary(),
          ],
        ),
        SizedBox(height: 20),
        _buildActionButtons(), // إضافة الأزرار أسفل المستطيل

      ],
    );
  }


  Widget _buildProjectDetails() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'عنوان المشروع الرئيسي',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 20),
          _buildProjectActions(),
          SizedBox(height: 20),
          // عرض المحتوى المحدد بناءً على الضغط
          if (_selectedContent != null) ...[
            _selectedContent!, // استخدام ! لأننا نعرف أنه ليس null هنا
            SizedBox(height: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildProjectActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildActionItem('نموذج العمل التجاري', () {
          _updateContent(
              _buildBusinessModelContent(context)); // تعيين كـ Widget
        }),
        _buildActionItem('سير المشروع', () {
          _updateContent(_buildProjectProgressContent()); // تعيين كـ Widget
        }),
        _buildActionItem('حول', () {
          _updateContent(_buildAboutContent()); // تعيين كـ Widget
        }),
      ],
    );
  }

////////////////////////////////////////////////////

  Widget _buildAboutContent() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildAboutSection('صاحب المشروع', 'أحمد محمد', 20, 18),
          _buildAboutSection(
            'البريد الإلكتروني',
            GestureDetector(
              onTap: () {
                _showChatDialog(context);
              },
              child: Text(
                'ahmed@example.com',
                style: TextStyle(fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
            16,
            16,
          ),
          _buildAboutSection('الموقع',
              GestureDetector(
                onTap: () {
                  // يمكنك إضافة وظيفة هنا لفتح الموقع عند الضغط
                },
                child: Text(
                  'www.example.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline, // إضافة خط تحت النص
                  ),
                ),
              ),
              16,
              14
          ),
          _buildAboutSection('نبذة عن المشروع',
              'يطمح المشروع إلى تحقيق نتائج ملموسة تسهم في تحسين العمليات المختلفة...',
              16, 14),
        ],
      ),
    );
  }

  Widget _buildAboutSection(String title, dynamic content, double titleSize,
      double contentSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 10),
        content is Widget
            ? content
            : Text(
          content,
          style: TextStyle(fontSize: contentSize),
          textAlign: TextAlign.right,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
        SizedBox(height: 10),
      ],
    );
  }

////////////////////////////////////////////////////
  Widget _buildProjectProgressContent() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildProgressSection('تاريخ الإنشاء', '01/01/2024', 20, 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // محاذاة لليسار
                children: [
                  Text(
                    'تاريخ محدد',
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey), // نص صغير
                  ),
                ],
              ),
              SizedBox(width: 5), // مسافة بين النصين
              _buildProgressSection('تاريخ الانتهاء', '30/06/2024', 20, 18),
            ],
          ),
          SizedBox(height: 10),
          _buildProgressSectionWithProgress(
              'المرحلة الحالية', 'مرحلة التحقق والتخطيط', 20, 18, 0.4),
          _buildProgressSection(
              'التحديات', ' نواجه بعض التحديات في التنفيذ \n نقص في الموارد',
              16, 14),
        ],
      ),
    );
  }

  Widget _buildProgressSectionWithProgress(String title, String content,
      double titleSize, double contentSize, double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: contentSize),
          textAlign: TextAlign.right,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
        SizedBox(height: 10),
        Container(
          width: 200, // عرض الشريط المحدد
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[300], // لون الخلفية
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: 200 * progress, // حساب العرض بناءً على النسبة
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green, // لون الشريط المكتمل
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildProgressSection(String title, String content, double titleSize,
      double contentSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
          textAlign: TextAlign.right,
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: contentSize),
          textAlign: TextAlign.right,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  ////////////////////////////////////////////////////

  Widget _buildBusinessModelContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // لمحاذاة المحتوى إلى اليمين
        children: [
          GestureDetector(
            onTap: () {
              // عرض الصورة بحجم أكبر عند الضغط عليها
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      width: 800,
                      // عرض الصورة في النافذة المنبثقة (يمكنك تعديل القيم)
                      height: 400,
                      // ارتفاع الصورة في النافذة المنبثقة (يمكنك تعديل القيم)
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/111.jpg', // استبدل بمسار الصورة الصحيح
                          fit: BoxFit.cover, // لتغطية المربع بالكامل
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 600, // عرض الصورة 600
              height: 300, // يمكنك ضبط الارتفاع حسب الحاجة
              decoration: BoxDecoration(
                color: Colors.white, // لون خلفية المربع
                borderRadius: BorderRadius.circular(10), // زوايا دائرية للمربع
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // زوايا دائرية للصورة
                child: Image.asset(
                  'assets/images/111.jpg', // استبدل بمسار الصورة الصحيح
                  width: 600, // عرض الصورة 600
                  height: 300, // ارتفاع الصورة
                  fit: BoxFit.cover, // لتغطية المربع بالكامل
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////
  Widget _buildActionItem(String title, Function action) {
    return GestureDetector(
      onTap: () {
        action(); // استدعاء الدالة
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF001F3F)),
        ),
      ),
    );
  }

  Widget _buildProjectSummary() {
    return Container(
      width: 250,
      height: 400,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, left: 20),
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
                image: AssetImage('assets/images/p1 (2).jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'اسم المشروع',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'مجال المشروع',
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
            'وصف مختصر',
            style: TextStyle(fontSize: 14, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          _buildRatingStars(), // إضافة النجوم هنا
        ],
      ),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedStar = index + 1; // تعيين رقم النجمة المحددة
            });
          },
          child: Icon(
            Icons.star,
            color: index < _selectedStar ? Colors.orange : Colors.grey[350], // تغيير اللون حسب التحديد
            size: 30,
          ),
        );
      }),
    );
  }
}