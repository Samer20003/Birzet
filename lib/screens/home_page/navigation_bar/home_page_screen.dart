import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ggg_hhh/screens/home_page/navigation_bar/Ideas.dart';
import 'package:ggg_hhh/screens/home_page/navigation_bar/Projects.dart';
import 'package:ggg_hhh/screens/home_page/navigation_bar/WhoWeAre.dart';
import '../../../../constants.dart';
import '../MyAccount.dart';
import 'AIChat.dart';
<<<<<<< Updated upstream
=======
import 'Chat.dart';
import 'Courses.dart';
import 'Ideas.dart';
import 'Launch_your_project.dart';
import 'Projects.dart';
import 'Success_stories.dart';
import 'WhoWeAre.dart';
import 'package:carousel_slider/carousel_slider.dart';
>>>>>>> Stashed changes

class homepagescreen extends StatefulWidget {
  const homepagescreen({super.key});
  _homepagescreenState createState() => _homepagescreenState();
}

class _homepagescreenState extends State<homepagescreen> {
  bool _isHoveringSearch = false;
  bool _isHoveringNotifications = false;
  bool _isHoveringProfile = false;
  bool _isSearching = false;
  bool _isIdeasPressed = false;
  bool _isHoveringIncubator = false;
  bool _isProjectsPressed = false;
  bool _isHoveringAboutUs = false;
  bool _isHoveringHome = false;
  bool _isHoveringContact = false;
<<<<<<< Updated upstream
=======
  bool _isCoursesPressed = false;
  bool _isHoveringSuccessStories = false;
  bool _isHoveringLaunchProject = false;
  bool _isDropdownOpen = false;


  String? selectedContactValue; // تعريف المتغير هنا
  String? selectedValue;
>>>>>>> Stashed changes



  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



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

<<<<<<< Updated upstream
=======
  final List<Map<String, dynamic>> _projects = [
    {
      'image': 'assets/images/idea1.png',
      'likes': '10',
      'comments': '2',
      'views': '30',
      'userImage': 'assets/images/user1.png',
      'userName': 'مشروع 1',
    },
    {
      'image': 'assets/images/idea2.png',
      'likes': '20',
      'comments': '4',
      'views': '60',
      'userImage': 'assets/images/user2.png',
      'userName': 'مشروع 2',
    },
    {
      'image': 'assets/images/idea3.png',
      'likes': '15',
      'comments': '3',
      'views': '45',
      'userImage': 'assets/images/user3.png',
      'userName': 'مشروع 3',
    },
    {
      'image': 'assets/images/idea4.png',
      'likes': '25',
      'comments': '5',
      'views': '75',
      'userImage': 'assets/images/user4.png',
      'userName': 'مشروع 4',
    },
    {
      'image': 'assets/images/idea5.png',
      'likes': '30',
      'comments': '6',
      'views': '90',
      'userImage': 'assets/images/user5.png',
      'userName': 'مشروع 5',
    },
  ];

  final List<Map<String, dynamic>> _ideas = [
    {
      'image': 'assets/images/idea1.png',
      'likes': '10',
      'comments': '2',
      'views': '30',
      'userImage': 'assets/images/user1.png',
      'userName': 'فكرة 1',
    },
    {
      'image': 'assets/images/idea2.png',
      'likes': '20',
      'comments': '4',
      'views': '60',
      'userImage': 'assets/images/user2.png',
      'userName': 'فكرة 2',
    },
    {
      'image': 'assets/images/idea3.png',
      'likes': '15',
      'comments': '3',
      'views': '45',
      'userImage': 'assets/images/user3.png',
      'userName': 'فكرة 3',
    },
    {
      'image': 'assets/images/idea4.png',
      'likes': '25',
      'comments': '5',
      'views': '75',
      'userImage': 'assets/images/user4.png',
      'userName': 'فكرة 4',
    },
    {
      'image': 'assets/images/idea5.png',
      'likes': '30',
      'comments': '6',
      'views': '90',
      'userImage': 'assets/images/user5.png',
      'userName': 'فكرة 5',
    },


  ];

  final List<Map<String, dynamic>> _courses = [
    {
      'image': 'assets/images/course1.png',
      'likes': '12',
      'comments': '3',
      'views': '45',
      'userImage': 'assets/images/user1.png',
      'userName': 'دورة 1',
    },
    {
      'image': 'assets/images/course2.png',
      'likes': '18',
      'comments': '5',
      'views': '75',
      'userImage': 'assets/images/user2.png',
      'userName': 'دورة 2',
    },
    {
      'image': 'assets/images/course3.png',
      'likes': '25',
      'comments': '7',
      'views': '90',
      'userImage': 'assets/images/user3.png',
      'userName': 'دورة 3',
    },
    {
      'image': 'assets/images/course4.png',
      'likes': '30',
      'comments': '6',
      'views': '120',
      'userImage': 'assets/images/user4.png',
      'userName': 'دورة 4',
    },
    {
      'image': 'assets/images/course5.png',
      'likes': '10',
      'comments': '2',
      'views': '25',
      'userImage': 'assets/images/user5.png',
      'userName': 'دورة 5',
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
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
              child: Text(
                'حسابي',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('حسابي'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()), // الانتقال إلى صفحة حسابي
                );
              },
            ),
            ListTile(
              title: const Text('مشاريعي الناشئة'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('سجل النشاطات'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('افكاري'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('استثماراتي'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('تسجيل خروج'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // المستطيل العلوي
            Container(
              width: double.infinity,
              height: 80,
              color: kPrimaryColor,
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
            ),

            // المستطيل الثاني
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // أيقونة الصورة الشخصية
                      MouseRegion(
                        onEnter: (_) => setState(() {
                          _isHoveringProfile = true;
                        }),
                        onExit: (_) => setState(() {
                          _isHoveringProfile = false;
                        }),
                        child: GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer(); // فتح القائمة الجانبية
                          },
                          child: Text(
                            '👤 ',
                            style: TextStyle(
                              color: _isHoveringProfile ? Colors.orangeAccent : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // أيقونة الإشعارات
                      MouseRegion(
                        onEnter: (_) => setState(() {
                          _isHoveringNotifications = true;
                        }),
                        onExit: (_) => setState(() {
                          _isHoveringNotifications = false;
                        }),
                        child: GestureDetector(
                          onTap: () {
                            // إضافة وظيفة للإشعارات
                          },
                          child: Text(
                            '🔔 ',
                            style: TextStyle(
                              color: _isHoveringNotifications ? Colors.orangeAccent : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // أيقونة البحث
                      MouseRegion(
                        onEnter: (_) => setState(() {
                          _isHoveringSearch = true;
                        }),
                        onExit: (_) => setState(() {
                          _isHoveringSearch = false;
                        }),
                        child: GestureDetector(
                          onTap: _startSearch,
                          child: Text(
                            '🔍 ',
                            style: TextStyle(
                              color: _isHoveringSearch ? Colors.orangeAccent : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // عنصر فارغ للتوسيع
                  const Spacer(),
                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringContact = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringContact = false;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AIChatScreen()),
                        );
                      },
                      child: Text(
                        'تواصل معنا',
                        style: TextStyle(
                          color: _isHoveringContact ? Colors.orangeAccent : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // روابط
                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringIdeas = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringIdeas = false;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IdeasScreen()),
                        );
                      },
                      child: Text(
                        'الأفكار',
                        style: TextStyle(
                          color: _isHoveringIdeas ? Colors.orangeAccent : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),


                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringProjects = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringProjects = false;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectsScreen()),
                        );
                      },
                      child: Text(
                        'المشاريع',
                        style: TextStyle(
                          color: _isHoveringProjects ? Colors.orangeAccent : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringAboutUs = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringAboutUs = false;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WhoWeAreScreen()),
                        );
                      },
                      child: Text(
                        'من نحن',
                        style: TextStyle(
                          color: _isHoveringAboutUs ? Colors.orangeAccent : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHoveringHome = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHoveringHome = false;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homepagescreen()),
                        );
                      },
                      child: Text(
                        'الرئيسية',
                        style: TextStyle(
                          color: _isHoveringHome ? Colors.orangeAccent : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% من عرض الشاشة
              margin: const EdgeInsets.all(16.0),
              height: 200, // ارتفاع أكبر للمستطيل
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white, width: 2), // حدود باللون الأبيض
              ),
<<<<<<< Updated upstream
              child: Stack(
                children: [
                  Positioned(
                    top: -20, // وضع العنوان فوق حدود المستطيل
                    right: 16, // وضع العنوان من جهة اليمين
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.blue[100], // خلفية شفافة للعنوان
                      child: const Text(
                        'المشاريع',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue), // لون النص أزرق
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: const Text(
                      'هذا هو المحتوى الخاص بالمشاريع.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% من عرض الشاشة
              margin: const EdgeInsets.all(16.0),
              height: 200, // ارتفاع أكبر للمستطيل
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white, width: 2), // حدود باللون الأبيض
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -20, // وضع العنوان فوق حدود المستطيل
                    right: 16, // وضع العنوان من جهة اليمين
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.green[100], // خلفية شفافة للعنوان
                      child: const Text(
                        'الأفكار',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue), // لون النص أزرق
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: const Text(
                      'هذا هو المحتوى الخاص بالأفكار.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% من عرض الشاشة
              margin: const EdgeInsets.all(16.0),
              height: 200, // ارتفاع أكبر للمستطيل
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white, width: 2), // حدود باللون الأبيض
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -20, // وضع العنوان فوق حدود المستطيل
                    right: 16, // وضع العنوان من جهة اليمين
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      color: Colors.red[100], // خلفية شفافة للعنوان
                      child: const Text(
                        'الدورات',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue), // لون النص أزرق
                      ),
                    ),
=======
            ),
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('سجل النشاطات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('افكاري'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('استثماراتي'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('تسجيل خروج'),
            onTap: () {
              Navigator.pop(context);
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
      color: kPrimaryColor, // استبدل بـ kPrimaryColor
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
>>>>>>> Stashed changes
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
                    child: const Text(
                      'هذا هو المحتوى الخاص بالدورات.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
<<<<<<< Updated upstream
            ),
            // first comment
            const SizedBox(height: 20),

            // مستطيل البحث
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

            // الجملة في الوسط
            const SizedBox(height: 20),
            // Footer
            Container(
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
            ),
          ],
        ),
=======
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
                  const SizedBox(width: 16),
                  _buildLink(
                    'قصص نجاح',
                    _isHoveringSuccessStories,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessStoriesScreen())); // الانتقال إلى صفحة قصص النجاح
                    },
                        (hovering) => setState(() {
                      _isHoveringSuccessStories = hovering;
                    }),
                  ),
                  const SizedBox(width: 16),
                  _buildLink(
                    'أطلق مشروعك',
                    _isHoveringLaunchProject,
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LaunchProjectScreen())); // الانتقال إلى صفحة إطلاق مشروعك
                    },
                        (hovering) => setState(() {
                      _isHoveringLaunchProject = hovering;
                    }),
                  ),
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isProjectsPressed = true; // تغيير الحالة عند دخول الفأرة
            });
          },
          onExit: (_) {
            setState(() {
              _isProjectsPressed = false; // إعادة الحالة عند مغادرة الفأرة
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjectsScreen()),
              );
            },
            child: Center( // وضع العنوان في المنتصف
              child: Text(
                'المشاريع',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isProjectsPressed ? Colors.orangeAccent : Colors.black, // تغيير اللون
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // إضافة مساحة بين العنوان والمربعات
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
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isIdeasPressed = true; // تغيير الحالة عند دخول الفأرة
            });
          },
          onExit: (_) {
            setState(() {
              _isIdeasPressed = false; // إعادة الحالة عند مغادرة الفأرة
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IdeasScreen()),
              );
            },
            child: Center( // وضع العنوان في المنتصف
              child: Text(
                'الأفكار',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isIdeasPressed ? Colors.orangeAccent : Colors.black, // تغيير اللون
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // إضافة مساحة بين العنوان والمربعات
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
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isCoursesPressed = true; // تغيير الحالة عند دخول الفأرة
            });
          },
          onExit: (_) {
            setState(() {
              _isCoursesPressed = false; // إعادة الحالة عند مغادرة الفأرة
            });
          },
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoursesScreen()),
              );
            },
            child: Center( // وضع العنوان في المنتصف
              child: Text(
                'الدورات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isCoursesPressed ? Colors.orangeAccent : Colors.black, // تغيير اللون
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20), // إضافة مساحة بين العنوان والمربعات
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _prevCourses),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildCourseCards(),
              ),
            ),
            IconButton(icon: Icon(Icons.arrow_forward), onPressed: _nextCourses),
          ],
        ),
      ],
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
      return _buildInfoCard(_ideas[itemIndex]);
    });
  }

  List<Widget> _buildCourseCards() {
    return List.generate(3, (index) {
      int itemIndex = (_currentCourseIndex + index) % _courses.length; // تحديث فهرس الدورات
      return _buildInfoCard(_courses[itemIndex]); // استخدام بيانات الدورات
    });
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
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(item['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.favorite, size: 16, color: Colors.red),
                  Text(item['likes'], style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Icon(Icons.comment, size: 16),
                  Text(item['comments'], style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Icon(Icons.remove_red_eye, size: 16),
                  Text(item['views'], style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(item['userName'], style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(item['userImage']),
              ),
            ],
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
>>>>>>> Stashed changes
      ),
    );
  }
}