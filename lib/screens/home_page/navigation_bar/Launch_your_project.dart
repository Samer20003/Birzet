import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants.dart';
import '../MyAccount.dart';
import 'AIChat.dart';
import 'Chat.dart';
import 'Courses.dart';
import 'FirstStepOfJourney.dart';
import 'Ideas.dart';
import 'Projects.dart';
import 'Success_stories.dart';
import 'WhoWeAre.dart';
import 'home_page_screen.dart';

class LaunchProjectScreen extends StatefulWidget {
  @override
  _LaunchProjectScreenState createState() => _LaunchProjectScreenState();
}

class _LaunchProjectScreenState extends State<LaunchProjectScreen> {
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
            _buildLaunchJourneySection(),
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

  Widget _buildLaunchJourneySection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'رحلة احتضان المشاريع الناشئة',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'ستساعدك حاضنة  ستارت أب على إطلاق مشروعك الناشئ وتسير معك خطوة بخطوة، وتقدم لك الإرشاد عند الحاجة. إن كانت لديك فكرة مشروع ناشئ لا تنتظر، ابدأ رحلة الاحتضان الآن.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,

              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          // تقليل عرض الزر
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjectFormScreen()), // تغيير هذا إلى الشاشة الجديدة
                );
              },
              style: ElevatedButton.styleFrom(
                iconColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'ابدأ رحلة الاحتضان',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
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
class ProjectFormScreen extends StatefulWidget {
  @override
  _ProjectFormScreenState createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _projectName;
  String? _projectDescription;
  String? _projectField;
  String? _projectStage;

  final List<String> stages = [
    'مرحلة دراسة الفكرة',
    'مرحلة التحقق والتخطيط',
    'مرحلة التمويل والتأمين',
    'مرحلة تأسيس الفريق والموارد',
    'مرحلة الإطلاق والنمو',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج المشروع'),
        backgroundColor: Color(0xFF0A1D47),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 700, // عرض المستطيل الكبير
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // محاذاة للنصوص لليمين
                children: [
                  Align(
                    alignment: Alignment.centerRight, // محاذاة العنوان لليمين
                    child: Text(
                      'معلومات المشروع',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A1D47),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('اسم المشروع', (value) {
                    _projectName = value;
                  }),
                  const SizedBox(height: 10),
                  _buildTextField('وصف المشروع', (value) {
                    _projectDescription = value;
                  }),
                  const SizedBox(height: 10),
                  _buildTextField('مجال المشروع', (value) {
                    _projectField = value;
                  }),
                  const SizedBox(height: 10),
                  _buildDropdownField(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // هنا يمكنك إضافة المنطق لإرسال البيانات أو حفظها
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال النموذج بنجاح')),
                        );
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstStepOfJourneyScreen()),
                      );

                    },
                    child: const Text('التالي'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // توزيع العناصر لليمين
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال $label';
              }
              return null;
            },
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10), // مسافة بين المستطيل والعنوان
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight, // محاذاة النص على اليمين
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // توزيع العناصر لليمين
      children: [
        Expanded(
          flex: 2,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: stages.map((String stage) {
              return DropdownMenuItem<String>(
                value: stage,
                child: Text(stage),
              );
            }).toList(),
            onChanged: (value) {
              _projectStage = value;
            },
            validator: (value) {
              if (value == null) {
                return 'يرجى اختيار المرحلة الحالية';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10), // مسافة بين المستطيل والعنوان
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight, // محاذاة النص على اليمين
            child: Text(
              'المرحلة الحالية',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}