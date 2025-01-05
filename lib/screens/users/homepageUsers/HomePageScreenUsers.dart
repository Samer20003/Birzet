import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import '../../basic/footer.dart';
import '../../basic/header.dart';
import '../navigation_bar/DrawerUsers/DrawerUsers.dart';
import '../navigation_bar/NavigationBarUsers.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepagescreen extends StatefulWidget {
  const homepagescreen({super.key});

  @override
  _homepagescreenState createState() => _homepagescreenState();
}

class _homepagescreenState extends State<homepagescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedContactValue;
  String? selectedValue;
  TextEditingController _searchController = TextEditingController();
  final CarouselSliderController buttonCarouselController = CarouselSliderController();

  final CarouselSliderController projectsCarouselController = CarouselSliderController();
  final CarouselSliderController ideasCarouselController = CarouselSliderController();
  final CarouselSliderController coursesCarouselController = CarouselSliderController();


  int _currentProjectIndex = 0;
  int _currentIdeaIndex = 0;
  int _currentCourseIndex = 0; // إضافة متغير لتتبع فهرس الدورات

  final List<Map<String, dynamic>> _projects = [
    {
      'image': 'assets/images/p1 (2).jpeg',
      'title': 'مختبر الابتكارات التكنولوجية',
      'description': 'مشروع لتطوير حلول تكنولوجيا المعلومات.',
    },
    {
      'image': 'assets/images/p1 (4).jpeg',
      'title': 'مشروع الطاقة المستدامة',
      'description': 'حلول مبتكرة في مجال الطاقة.',
    },
    {
      'image': 'assets/images/p1 (6).jpeg',
      'title': 'التطبيقات الذكية',
      'description': 'مشروع لتطوير تطبيقات الذكاء الاصطناعي.',
    },
    {
      'image': 'assets/images/p1 (5).jpeg',
      'title': 'تعليم مبتكر',
      'description': 'تعزيز تجربة التعلم باستخدام التكنولوجيا',
    },
  ];
  final List<Map<String, dynamic>> _ideas = [
    {
      'image': 'assets/images/D4.jpeg',
      'title': 'تطبيق توصيل الطعام',
      'description': 'تطوير تطبيق يتيح للمستخدمين طلب الطعام من المطاعم المحلية وتوصيله إلى منازلهم.',
      'commentsCount': 5, // عدد التعليقات
      'likesCount': 15, // عدد الإعجابات
    },
    {
      'image': 'assets/images/D1.jpeg',
      'title': 'منصة التعليم الإلكتروني',
      'description': 'إنشاء منصة لتقديم الدورات التعليمية عبر الإنترنت لمختلف المجالات.',
      'commentsCount': 8, // عدد التعليقات
      'likesCount': 20, // عدد الإعجابات
    },
    {
      'image': 'assets/images/D3.jpeg',
      'title': 'خدمة تأجير السيارات',
      'description': 'تطوير خدمة تأجير السيارات عبر تطبيق يتيح للمستخدمين اختيار السيارة المناسبة.',
      'commentsCount': 12, // عدد التعليقات
      'likesCount': 30, // عدد الإعجابات
    },
    {
      'image': 'assets/images/D2.jpeg',
      'title': 'تطبيق إدارة المهام',
      'description': 'تطبيق يساعد المستخدمين على تنظيم مهامهم اليومية وإدارة الوقت بشكل فعال.',
      'commentsCount': 3, // عدد التعليقات
      'likesCount': 10, // عدد الإعجابات
    },
  ];

  final List<Map<String, dynamic>> _courses = [
    {
      'image': 'assets/images/C4.jpeg',
      'title': 'دورة أساسيات ريادة الأعمال',
      'description': 'تعلم المبادئ الأساسية لريادة الأعمال وكيفية بدء مشروع ناجح.',
    },
    {
      'image': 'assets/images/C5.jpeg',
      'title': 'دورة تطوير نموذج العمل',
      'description': 'كيفية إنشاء نموذج عمل فعّال يحقق النجاح والاستدامة.',
    },
    {
      'image': 'assets/images/C1.jpeg',
      'title': 'دورة استراتيجيات الاستثمار',
      'description': 'استراتيجيات فعّالة للاستثمار في المشاريع الناشئة وتعزيز العائدات.',
    },
    {
      'image': 'assets/images/C2.jpeg',
      'title': 'دورة التسويق للمشاريع الناشئة',
      'description': 'استراتيجيات التسويق الفعالة لجذب العملاء للمشاريع الناشئة.',
    },
    {
      'image': 'assets/images/C3.jpeg',
      'title': 'دورة التحليل المالي للمشاريع',
      'description': 'كيفية قراءة البيانات المالية وتحليلها لاتخاذ قرارات الاستثمار الصحيحة.',
    },
  ];

  void _nextProjects() {
    setState(() {
      _currentProjectIndex = (_currentProjectIndex + 1) % _projects.length;
    });
  }

  void _prevProjects() {
    setState(() {
      _currentProjectIndex =
          (_currentProjectIndex - 1 + _projects.length) % _projects.length;
    });
  }

  void _nextIdeas() {
    setState(() {
      _currentIdeaIndex = (_currentIdeaIndex + 1) % _ideas.length;
    });
  }

  void _prevIdeas() {
    setState(() {
      _currentIdeaIndex =
          (_currentIdeaIndex - 1 + _ideas.length) % _ideas.length;
    });
  }

  void _nextCourses() {
    setState(() {
      _currentCourseIndex =
          (_currentCourseIndex + 1) % _courses.length; // تحديث فهرس الدورات
    });
  }

  void _prevCourses() {
    setState(() {
      _currentCourseIndex = (_currentCourseIndex - 1 + _courses.length) %
          _courses.length; // تحديث فهرس الدورات
    });
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileLayout(),
      tablet: _buildTabletLayout(),
      desktop: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(backgroundColor: Color(0xFF0A1D47)),
      drawer: DrawerUsers(scaffoldKey: _scaffoldKey),
      body: _buildBody(),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(backgroundColor: Color(0xFF0A1D47)),
      drawer: DrawerUsers(scaffoldKey: _scaffoldKey),
      body: _buildBody(),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(backgroundColor: Color(0xFF0A1D47)),
      drawer: DrawerUsers(scaffoldKey: _scaffoldKey),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderScreen(),
          NavigationBarUsers(scaffoldKey: _scaffoldKey, onSelectContact: (value) {}),
          const SizedBox(height: 20),
          _buildProjectsSection(),
          const SizedBox(height: 40),
          _buildIdeasSection(),
          const SizedBox(height: 40),
          _buildCoursesSection(),
          const SizedBox(height: 20),
          Footer(),
        ],
      ),
    );
  }
  Widget _buildProjectsSection() {
    return Column(
      children: [
        _buildSectionHeader('أكثر المشاريع الرائجة '),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _prevProjects),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildProjectCards(),
              ),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward), onPressed: _nextProjects),
          ],
        ),
      ],
    );
  }

  Widget _buildIdeasSection() {
    return Column(
      children: [
        _buildSectionHeader('أكثر الأفكار الرائجة '),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _prevIdeas),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildIdeaCards(),
              ),
            ),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: _nextIdeas),
          ],
        ),
      ],
    );
  }

  Widget _buildCoursesSection() {
    return Column(
      children: [
        _buildSectionHeader('أكثر الدورات طلبا'), // عنوان قسم الدورات
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _prevCourses),
            // زر السهم الأيسر
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildCourseCards(),
              ),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward), onPressed: _nextCourses),
            // زر السهم الأيمن
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  List<Widget> _buildProjectCards() {
    return List.generate(3, (index) {
      int itemIndex = (_currentProjectIndex + index) % _projects.length;
      return _buildInfoCard(_projects[itemIndex]);
    });
  }

  List<Widget> _buildIdeaCards() {
    return List.generate(3, (index) {
      int itemIndex = (_currentIdeaIndex + index) % _ideas.length;
      return _buildInfoCardForIdeas(_ideas[itemIndex]); // استخدم الدالة الجديدة
    });
  }

  List<Widget> _buildCourseCards() {
    return List.generate(3, (index) {
      int itemIndex = (_currentCourseIndex + index) %
          _courses.length; // تحديث فهرس الدورات
      return _buildInfoCard(_courses[itemIndex]); // استخدام بيانات الدورات
    });
  }

  Widget _buildInfoCardForIdeas(Map<String, dynamic> item) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.28,
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
          // صورة الفكرة
          Container(
            width: 180,
            height: 120,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/defaultimg.jpeg'),
                // استبدل بهذا المسار للصورة الموحدة
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // أيقونة التعليقات
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment, color: kPrimaryColor),
                    onPressed: () {
                      // هنا يمكنك إضافة المنطق للتعليقات
                    },
                  ),
                  Text(
                    '${item['commentsCount']}', // عدد التعليقات
                    style: TextStyle(fontSize: 12), // حجم النص
                  ),
                ],
              ),
              // أيقونة الإعجاب
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: kPrimaryColor),
                    onPressed: () {
                      // هنا يمكنك إضافة المنطق للإعجاب
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
        ],
      ),
    );
  }

  Widget _buildInfoCard(Map<String, dynamic> item) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.28,
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
          // صورة المشروع
          Container(
            width: 180,
            height: 120,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // اسم المشروع
          Text(
            item['title'], // تأكد من أن لديك مفتاح 'title' في البيانات
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // وصف المشروع
          Text(
            item['description'],
            // تأكد من أن لديك مفتاح 'description' في البيانات
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}