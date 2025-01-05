import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../basic/footer.dart';
import '../../basic/header.dart';
import '../navigation_bar/DrawerUsers/DrawerUsers.dart';
import '../navigation_bar/NavigationBarUsers.dart';

class GrantsPage extends StatefulWidget {
  const GrantsPage({super.key});

  @override
  _GrantsPageState createState() => _GrantsPageState();
}

class _GrantsPageState extends State<GrantsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, String>> grants = [
    {
      'institution': 'مؤسسة التعليم العالي',
      'title': 'منحة دراسية للطلاب الجدد',
    },
    {
      'institution': 'مؤسسة التنمية الاجتماعية',
      'title': 'منحة لدعم المشاريع الصغيرة',
    },
    {
      'institution': 'مؤسسة الابتكار',
      'title': 'منحة للبحث العلمي',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0A1D47),
      ),
      drawer: DrawerUsers(scaffoldKey: _scaffoldKey), // استدعاء Drawer
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderScreen(), // استدعاء الهيدر
            NavigationBarUsers(
              scaffoldKey: _scaffoldKey,
              onSelectContact: (value) {
                // منطق لتحديد جهة الاتصال
              },
            ),
            const SizedBox(height: 40),
            // استخدام Column بدلاً من Wrap لعرض مستطيل واحد في كل سطر
            Column(
              children: grants.map((grant) => _buildGrantCard(grant)).toList(),
            ),
            const SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildGrantCard(Map<String, String> grant) {
    return Container(
      width: 800, // عرض المستطيل
      margin: EdgeInsets.only(bottom: 20), // إضافة مسافة بين المستطيلات
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // تغير موقع الظل
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // تغيير ترتيب العناصر: زر "تقديم الآن" على اليسار
          SizedBox(
            width: 150, // تحديد عرض الزر
            child: ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة الوظيفة لزر "تقديم الآن"
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم الضغط على تقديم الآن')),
                );
              },
              child: Text('تقديم الآن'),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // تعديل إلى start
            children: [
              Text(
                grant['institution']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                grant['title']!,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}