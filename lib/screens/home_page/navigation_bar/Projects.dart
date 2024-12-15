import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ggg_hhh/screens/welcome/welcome_screen.dart';
import '../../../../constants.dart';
import '../../Login/login_screen.dart';
import '../MyAccount.dart';
import 'AIChat.dart';
import 'Ideas.dart';
import 'WhoWeAre.dart';
import 'home_page_screen.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  bool _isHoveringSearch = false;
  bool _isHoveringNotifications = false;
  bool _isHoveringProfile = false;
  bool _isSearching = false;
  bool _isHoveringIdeas = false;
  bool _isHoveringProjects = false;
  bool _isHoveringAboutUs = false;
  bool _isHoveringHome = false;
  bool _isHoveringContact = false;
  bool _isHoveringBox = false; // متغير للتحويم على المربع

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
            const SizedBox(height: 40),
            _buildHoverBox(), // إضافة المربع هنا
            const SizedBox(height: 40),
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
        ],
      ),
    );
  }

  Widget _buildHoverBox() {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHoveringBox = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHoveringBox = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 250, // حجم المربع
        height: 250, // حجم المربع
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: _isHoveringBox
            ? _buildHoveredContent() // عرض المحتوى عند التحويم
            : _buildInitialContent(), // عرض المحتوى الأول
      ),
    );
  }

  Widget _buildInitialContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/Success1.PNG', // صورة المربع الأول
          width: 240,
          height: 240,
          fit: BoxFit.cover,
        ),
        // Text(
        //   ' طرقات ',
        //   style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }

  Widget _buildHoveredContent() {
    return Stack(
      children: [
        Positioned(
          right: 10,
          top: 10,
          child: ClipOval(
            child: Image.asset(
              'assets/images/Success1.PNG', // صورة دائرية عند التحويم
              width: 80, // حجم الصورة صغير
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'طرقات ',
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                ' Turqat offers a range of functions and services to have safer travels and ',
                style: GoogleFonts.poppins(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'اقرأ المزيد',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
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