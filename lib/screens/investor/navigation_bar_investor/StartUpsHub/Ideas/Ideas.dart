import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../basic/footer.dart';
import '../../../../basic/header.dart';
import '../../Drawerinvestor/Drawerinvestor.dart';
import '../../NavigationBarinvestor.dart';
import 'IdeasInformationInvestor.dart';

class IdeasScreen extends StatefulWidget {
  const IdeasScreen({super.key});

  @override
  _IdeasScreenState createState() => _IdeasScreenState();
}

class _IdeasScreenState extends State<IdeasScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> ideas = [
    {
      'title': 'تطبيق توصيل الطعام',
      'description': 'تطوير تطبيق يتيح للمستخدمين طلب الطعام من المطاعم المحلية وتوصيله إلى منازلهم.',
      'commentsCount': 5, // عدد التعليقات
      'likesCount': 15, // عدد الإعجابات
      'isLiked': false, // حالة الإعجاب
    },
    {
      'title': 'منصة التعليم الإلكتروني',
      'description': 'إنشاء منصة لتقديم الدورات التعليمية عبر الإنترنت لمختلف المجالات.',
      'commentsCount': 8, // عدد التعليقات
      'likesCount': 20, // عدد الإعجابات
      'isLiked': false, // حالة الإعجاب
    },
    {
      'title': 'خدمة تأجير السيارات',
      'description': 'تطوير خدمة تأجير السيارات عبر تطبيق يتيح للمستخدمين اختيار السيارة المناسبة.',
      'commentsCount': 12, // عدد التعليقات
      'likesCount': 30, // عدد الإعجابات
      'isLiked': false, // حالة الإعجاب
    },
    {
      'title': 'تطبيق إدارة المهام',
      'description': 'تطبيق يساعد المستخدمين على تنظيم مهامهم اليومية وإدارة الوقت بشكل فعال.',
      'commentsCount': 3, // عدد التعليقات
      'likesCount': 10, // عدد الإعجابات
      'isLiked': false, // حالة الإعجاب
    },
  ];
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
            ), //
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: ideas.map((idea) => _buildInfoCardForIdeas(idea)).toList(),
            ),
            const SizedBox(height: 40),
            Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardForIdeas(Map<String, dynamic> item) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة موحدة لكل الأفكار
          Container(
            width: 180,
            height: 120,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/defaultimg.jpeg'), // المسار للصورة الموحدة
                fit: BoxFit.cover,
              ),
            ),
          ),
          // اسم الفكرة
          Text(
            item['title'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // وصف الفكرة
          Text(
            item['description'],
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8), // مسافة قبل الأيقونات
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // محاذاة العناصر إلى اليسار
            children: [
              // أيقونة التعليقات
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment, color: kPrimaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IdeasInformationInvestorScreen()),
                      );                    },
                  ),
                  Text(
                    '${item['commentsCount']}', // عدد التعليقات
                    style: TextStyle(fontSize: 12), // حجم النص
                  ),
                ],
              ),
              const SizedBox(width: 20), // مسافة بين الأيقونات
              // أيقونة الإعجاب
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: item['isLiked'] ? Colors.red : kPrimaryColor, // تغيير اللون حسب حالة الإعجاب
                    ),
                    onPressed: () {
                      setState(() {
                        item['isLiked'] = !item['isLiked']; // تغيير حالة الإعجاب
                        if (item['isLiked']) {
                          item['likesCount']++; // زيادة عدد الإعجابات
                        } else {
                          item['likesCount']--; // تقليل عدد الإعجابات
                        }
                      });
                    },
                  ),
                  Text(
                    '${item['likesCount']}', // عدد الإعجابات
                    style: TextStyle(fontSize: 12), // حجم النص
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8), // مسافة قبل الزر
          // زر المزيد من المعلومات
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IdeasInformationInvestorScreen()),
              );
            },
            child: Text('المزيد من المعلومات'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor, // لون النص
            ),
          ),
        ],
      ),
    );
  }



}