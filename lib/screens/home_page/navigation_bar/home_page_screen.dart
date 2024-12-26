import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import '../../Welcome/welcome_screen.dart';
import '../Activity.dart';
import '../MyAccount.dart';
import '../MyIdeas.dart';
import '../thebeginning.dart';
import 'AIChat.dart';
import 'Chat.dart';
import 'Courses.dart';
import 'Ideas.dart';
import 'Launch_your_project.dart';
import 'Projects.dart';
import 'Success_stories.dart';
import 'WhoWeAre.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepagescreen extends StatefulWidget {
  const homepagescreen({super.key});

  @override
  _homepagescreenState createState() => _homepagescreenState();
}

class _homepagescreenState extends State<homepagescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isHoveringProfile = false;
  bool _isHoveringNotifications = false;
  bool _isHoveringSearch = false;
  bool _isHoveringContact = false;
  bool _isHoveringSuccessStories = false;
  bool _isHoveringLaunchProject = false;
  bool _isHoveringIncubator = false;
  bool _isHoveringAboutUs = false;
  bool _isHoveringHome = false;
  String? selectedContactValue;
  String? selectedValue;
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  final CarouselSliderController buttonCarouselController = CarouselSliderController();

  final CarouselSliderController projectsCarouselController = CarouselSliderController();
  final CarouselSliderController ideasCarouselController = CarouselSliderController();
  final CarouselSliderController coursesCarouselController = CarouselSliderController();

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
    });
  }
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
      'likesCount': 15,    // عدد الإعجابات
    },
    {
      'image': 'assets/images/D1.jpeg',
      'title': 'منصة التعليم الإلكتروني',
      'description': 'إنشاء منصة لتقديم الدورات التعليمية عبر الإنترنت لمختلف المجالات.',
      'commentsCount': 8, // عدد التعليقات
      'likesCount': 20,    // عدد الإعجابات
    },
    {
      'image': 'assets/images/D3.jpeg',
      'title': 'خدمة تأجير السيارات',
      'description': 'تطوير خدمة تأجير السيارات عبر تطبيق يتيح للمستخدمين اختيار السيارة المناسبة.',
      'commentsCount': 12, // عدد التعليقات
      'likesCount': 30,    // عدد الإعجابات
    },
    {
      'image': 'assets/images/D2.jpeg',
      'title': 'تطبيق إدارة المهام',
      'description': 'تطبيق يساعد المستخدمين على تنظيم مهامهم اليومية وإدارة الوقت بشكل فعال.',
      'commentsCount': 3, // عدد التعليقات
      'likesCount': 10,    // عدد الإعجابات
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
      _currentProjectIndex = (_currentProjectIndex - 1 + _projects.length) % _projects.length;
    });
  }

  void _nextIdeas() {
    setState(() {
      _currentIdeaIndex = (_currentIdeaIndex + 1) % _ideas.length;
    });
  }

  void _prevIdeas() {
    setState(() {
      _currentIdeaIndex = (_currentIdeaIndex - 1 + _ideas.length) % _ideas.length;
    });
  }

  void _nextCourses() {
    setState(() {
      _currentCourseIndex = (_currentCourseIndex + 1) % _courses.length; // تحديث فهرس الدورات
    });
  }

  void _prevCourses() {
    setState(() {
      _currentCourseIndex = (_currentCourseIndex - 1 + _courses.length) % _courses.length; // تحديث فهرس الدورات
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF0A1D47),
      ),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildNavigationBar(),
            const SizedBox(height: 20),
            _buildProjectsSection(),
            const SizedBox(height: 40),
            _buildIdeasSection(),
            const SizedBox(height: 40),
            _buildCoursesSection(),
            const SizedBox(height: 20),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey),
            child: SizedBox.shrink(), // أو يمكنك استخدام Widget آخر إذا كنت تريد
          ),
          ListTile(
            title: const Text('حسابي'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('مشاريعي الناشئة'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => thebeginningScreen()), // استبدل بـ مشاريعيPage() بالصفحة المطلوبة
              );
            },
          ),
          ListTile(
            title: const Text('سجل النشاطات'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityScreen()), // استبدل بـ سجلالنشاطاتPage() بالصفحة المطلوبة
              );
            },
          ),
          ListTile(
            title: const Text('افكاري'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyIdeasScreen()), // استبدل بـ افكاريPage() بالصفحة المطلوبة
              );
            },
          ),
          ListTile(
            title: const Text('تسجيل خروج'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()), // استبدل بـ استثماراتيPage() بالصفحة المطلوبة
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 80,
      color: Color(0xFF0A1D47), // استخدام اللون مباشرة
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/image500500.png',
              width: 170,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'حاضنة ستارت أب',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildIcon(
                    '👤',
                    _isHoveringProfile,
                        () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                        (hovering) => setState(() {
                      _isHoveringProfile = hovering;
                    }),
                  ),
                  const SizedBox(width: 16),
                  _buildIcon(
                    '🔔',
                    _isHoveringNotifications,
                        () {
                      // وظيفة الإشعارات
                    },
                        (hovering) => setState(() {
                      _isHoveringNotifications = hovering;
                    }),
                  ),
                  const SizedBox(width: 16),
                  _buildIcon(
                    '🔍',
                    _isHoveringSearch,
                    _startSearch,
                        (hovering) => setState(() {
                      _isHoveringSearch = hovering;
                    }),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  // تواصل معنا
                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringContact = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringContact = false;
                    }),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedContactValue,
                        hint: Text(
                          'تواصل معنا',
                          style: TextStyle(
                            color: _isHoveringContact ? Colors.orangeAccent : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedContactValue = newValue;

                            if (newValue == 'دردشة مباشرة') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                            } else if (newValue == 'اسأل AI') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AIChatScreen()));
                            }
                          });
                        },
                        items: [
                          DropdownMenuItem(value: 'دردشة مباشرة', child: Text('دردشة مباشرة')),
                          DropdownMenuItem(value: 'اسأل AI', child: Text('اسأل AI')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  _buildLink(
                    'قصص نجاح',
                    _isHoveringSuccessStories,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessStoriesScreen()));
                    },
                        (hovering) => setState(() {
                      _isHoveringSuccessStories = hovering;
                    }),
                  ),
                  const SizedBox(width: 20),
                  _buildLink(
                    'أطلق مشروعك',
                    _isHoveringLaunchProject,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchProjectScreen()));
                    },
                        (hovering) => setState(() {
                      _isHoveringLaunchProject = hovering;
                    }),
                  ),
                  const SizedBox(width: 20),
                  // حاضنة ستارت أب
                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringIncubator = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringIncubator = false;
                    }),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        hint: Text(
                          'حاضنة ستارت أب',
                          style: TextStyle(
                            color: _isHoveringIncubator ? Colors.orangeAccent : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;

                            if (newValue == 'المشاريع') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectsScreen()));
                            } else if (newValue == 'الأفكار') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IdeasScreen()));
                            } else if (newValue == 'الدورات') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesScreen()));
                            }
                          });
                        },
                        items: [
                          DropdownMenuItem(value: 'المشاريع', child: Text('المشاريع')),
                          DropdownMenuItem(value: 'الأفكار', child: Text('الأفكار')),
                          DropdownMenuItem(value: 'الدورات', child: Text('الدورات')),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  _buildLink(
                    'من نحن',
                    _isHoveringAboutUs,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAreScreen()));
                    },
                        (hovering) => setState(() {
                      _isHoveringAboutUs = hovering;
                    }),
                  ),
                  const SizedBox(width: 20),
                  _buildLink(
                    'الرئيسية',
                    _isHoveringHome,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homepagescreen()));
                    },
                        (hovering) => setState(() {
                      _isHoveringHome = hovering;
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (_isSearching)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'ابحث عن...',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _stopSearch,
                  ),
                ),
                onSubmitted: (value) {
                  _stopSearch();
                },
              ),
            ),
        ],
      ),
    );
  }
  Widget _buildIcon(String icon, bool isHovering, VoidCallback onTap, Function(bool) onHover) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          icon,
          style: TextStyle(
            color: isHovering ? Colors.orangeAccent : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLink(String title, bool isHovering, VoidCallback onTap, Function(bool) onHover) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            color: isHovering ? Colors.orangeAccent : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: _nextProjects),
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
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _prevCourses), // زر السهم الأيسر
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildCourseCards(),
              ),
            ),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: _nextCourses), // زر السهم الأيمن
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
      int itemIndex = (_currentCourseIndex + index) % _courses.length; // تحديث فهرس الدورات
      return _buildInfoCard(_courses[itemIndex]); // استخدام بيانات الدورات
    });
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
          // صورة الفكرة
          Container(
            width: 180,
            height: 120,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/defaultimg.jpeg'), // استبدل بهذا المسار للصورة الموحدة
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
            item['description'], // تأكد من أن لديك مفتاح 'description' في البيانات
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  // Footer
  Widget _buildFooter() {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/image400400.png',
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            'نحن نحتضن مشروعك مجانًا، ونقدم لك الإرشادات، ثم نساعدك في الحصول على التمويل.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xFF0A1D47),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'اتصل بنا\n'
                'فلسطين – نابلس\n'
                'البريد الإلكتروني: StartupsHub@gmail.com\n'
                'الهاتف: 97022945845+\n'
                'الفاكس: 97022946947+\n'
                'حقوق الطبع والنشر © 2024',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          // أزرار التواصل الاجتماعي
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                onPressed: () {
                  // رابط فيسبوك
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.instagram),
                onPressed: () {
                  // رابط إنستجرام
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.twitter),
                onPressed: () {
                  // رابط تويتر
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  // رابط لينكدإن
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}