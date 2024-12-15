import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../MyAccount.dart';
import 'AIChat.dart';
import 'Chat.dart';
import 'Courses.dart';
import 'Ideas.dart';
import 'Launch_your_project.dart';
import 'Projects.dart';
import 'WhoWeAre.dart';
import 'home_page_screen.dart';

class SuccessStoriesScreen extends StatefulWidget {
  @override
  _SuccessStoriesScreenState createState() => _SuccessStoriesScreenState();
}

class _SuccessStoriesScreenState extends State<SuccessStoriesScreen> {
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
  bool isHovered = false; // نقلت هنا
  bool _isHoveringBox = false; // متغير للتحويم على المربع

  String? selectedContactValue;
  String? selectedValue;
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  late List<bool> _hoveredStates;

  // بيانات العناصر مع تفاصيل إضافية
  final List<Map<String, String>> _items = [
  {
  "title": " طرقات ",
  "image": "assets/images/Success1.PNG",
  "description": "Turqat offers a range of functions and services to have safer travels and a peace of mind.",
  "route": "/page1",
  },
  {
  "title": "سكل زاد",
  "image": "assets/images/Success2.PNG",
  "description": " E-learning platform for private tutoring for university students that help them pass their degrees and be prepared for the workforce",
  "route": "/page2",
  },
  {
  "title": "SHIFT-ICT ",
  "image": "assets/images/Success3.PNG",
  "description": "SHIFT-ICT is an innovative, technological service provider company that delivers IT services with high quality and competitive cost advantages.",
  "route": "/page3",
  },
  {
  "title": "Developers Plus",
  "image": "assets/images/Success4.PNG",
  "description": " We, Developers Plus, are a specialized company in Software Development.",
  "route": "/page4",
  },
  {
  "title": " Algebra Intelligence",
  "image": "assets/images/Success5.PNG",
  "description": " Algebra Intelligence is a software development firm that integrates artificial intelligence solutions into the Energy Sector to usher smart technology into sustainable development.",
  "route": "/page5",
  },
  {
  "title": " Newline Tech Company for Information Technology",
  "image": "assets/images/Success6.PNG",
  "description": "NEWLINE TECH) is a Palestinian company established early 2011. NEWLINE TECH is dedicated to provide technology-based solutions, In simple terms",
  "route": "/page6",
  },
  ];
  @override
  void initState() {
    super.initState();
    _hoveredStates = List<bool>.filled(_items.length, false);
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
            _buildGrid(), // إضافة المربعات هنا
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
      color: Color(0xFF0A1D47),
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
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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

  Widget _buildGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _buildCircleFrame(index);
        },
      ),
    );
  }

  Widget _buildCircleFrame(int index) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredStates[index] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredStates[index] = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: _hoveredStates[index] ? Colors.grey[300] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: _hoveredStates[index]
            ? _buildHoveredContent(index) // تمرير الفهرس للمحتوى عند التحويم
            : _buildInitialContent(_items[index]["title"]!, _items[index]["image"]!),
      ),
    );
  }

  Widget _buildInitialContent(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 240,
          height: 240,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildHoveredContent(int index) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          top: 10,
          child: ClipOval(
            child: Image.asset(
              _items[index]["image"]!, // استخدام الصورة الخاصة بكل عنصر
              width: 80,
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
                _items[index]["title"]!, // استخدام العنوان الخاص بكل عنصر
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                _items[index]["description"]!, // استخدام الوصف الخاص بكل عنصر
                style: GoogleFonts.poppins(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, _items[index]["route"]!); // التنقل إلى الصفحة الخاصة
                },
                child: Text(
                  'اقرأ المزيد',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


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
}