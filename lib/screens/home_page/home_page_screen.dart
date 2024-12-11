
import 'package:flutter/material.dart';
import '../../components/background.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/home_page_btn.dart';
import 'components/home_page_image.dart';
import 'package:google_fonts/google_fonts.dart'; // تأكد من إضافة الحزمة في pubspec.yaml
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class homepagescreen extends StatefulWidget {
  const homepagescreen({Key? key}) : super(key: key);

  @override
  _homepagescreenState createState() => _homepagescreenState();
}

class _homepagescreenState extends State<homepagescreen> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 1; // نبدأ من العنصر الأول

  final List<Map<String, String>> _items = [
    {
      'image': 'assets/images/home1.jpeg',
      'text': 'Developing opportunities for creative and entrepreneurial ideas and supporting expansion efforts and reaching new markets .',


    },
    {
      'image': 'assets/images/home2.jpeg',
      'text': 'Strengthening the mechanisms and requirements for expansion and developing the entrepreneurial investment sector to finance emerging companies.',
    },
    {
      'image': 'assets/images/home3.jpeg',
      'text': 'Empowering the business environment by working on developing programs and obtaining investment.',
    },
  ];


  @override
  void initState() {
    super.initState();

    // عرض الصورة الأولى مباشرة بعد بناء الواجهة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_currentPage);
    });

    // بدء التبديل التلقائي للصور بعد عرض الصورة الأولى
    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    _currentPage++;
    if (_currentPage >= _items.length + 1) {
      _currentPage = 1; // العودة إلى العنصر الأول (بداية)
      _pageController.jumpToPage(1); // الانتقال مباشرة إلى الصورة الثانية
    } else {
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
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
    const Text(
    'StartUps Hub',
    style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
      ClipRRect(
        child: Image.asset(
          'assets/images/image500500.png',
          width: 170, // تحديد عرض الصورة
          height: 170, // تحديد ارتفاع الصورة
          fit: BoxFit.cover, // ضبط الصورة
        ),
      ),
    ],
    ),
    ),
            // المستطيل الثاني
            Container(
              width: double.infinity,
              color: kLightCreamColor,
              padding: EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Home', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('FAQ', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Projects', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Start now', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Invest now', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Beneficiaries', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 30), // مسافة أكبر بين عرض الصور والنص

            // عرض الصور مع العبارات
            // عرض الصور مع العبارات
            SizedBox(
              height: 300, // تحديد ارتفاع ثابت لعرض الصور
              child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length + 2, // إضافة عنصرين لتسهيل دوران العرض
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(); // عرض فارغ في البداية
                  } else if (index == _items.length + 1) {
                    return Container(); // عرض فارغ في النهاية
                  } else {
                    return Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            _items[index - 1]['image']!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            _items[index - 1]['text']!,
                            style: GoogleFonts.poppins( // استخدام خط Poppins
                              fontSize: 16,
                              color: const Color(0xE2131313), // اللون المحدد
                              fontWeight: FontWeight.bold, // الوزن المحدد
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 40), // زيادة المسافة بين عرض الصور والنص

            // الجملة بعد عرض الصور
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Are you ready to transform your innovative idea into a thriving business?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins( // استخدم خط جميل
                      fontSize: 24,
                      color: const Color(0xE2122088), // إذا كنت ترغب في استخدام اللون بدون الشفافية
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10), // مسافة بين الجمل
                  Text(
                    'Join *Startups Hub* today!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), // زيادة المسافة بين الجملة والزر

            // زر التسجيل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center( // مركز الزر في المنتصف
                child: SizedBox(
                  width: 200, // تحديد عرض الزر
                  child: ElevatedButton(
                    onPressed: () {
                      // هنا يمكنك إضافة وظيفة الزر
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent, // لون الخلفية للزر
                      padding: const EdgeInsets.symmetric(vertical: 15.0), // حجم الزر
                      textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    child: const Text('Register now'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // مسافة إضافية في الأسفل

            // مكونات الصفحة الأخرى
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // محتوى إضافي
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('محتوى إضافي 1')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('محتوى إضافي 2')),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('محتوى إضافي 3')),
                  ),

                ],
              ),
            ),
            // Footer
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // إضافة اللوجو في الأعلى
                  Image.asset(
                    'assets/images/image400400.png', // تأكد من مسار الصورة
                    height: 100,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We incubate your project for free, provide you with guidance, and then help you obtain financing.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xE2122088),
                      fontWeight: FontWeight.bold, // الوزن المحدد

                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Contact Us\n'
                        'Palestine – Nablus\n'
                        'email: StartupsHub@gmail.com\n'
                        'Tel: 97022945845+\n'
                        'Fax: 97022946947+\n'
                        'Copy rights © 2024',
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
      ),
    );
  }
}
