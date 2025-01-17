import 'package:flutter/material.dart';
import 'ActiveUsersTable.dart';
import 'Dashboard.dart';
import 'FeedbackPage.dart';
import 'Grants.dart';
import 'IdeasPage.dart';
import 'ProjectsPage.dart';
import 'UserRequestTable.dart';
import 'UsersPage.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Map<String, String>> courses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B),
      body: Row(
        children: [
          _buildSidebar(context),
          Expanded(child: _buildMainContent(context)),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 250,
      color: Color(0xFF4A4A4A),
      child: Column(
        children: [
          SizedBox(height: 70),
          _buildMenuItem(context, "لوحة التحكم", DashboardPage()),
          _buildMenuItem(context, "المستخدمون", UsersPage()),
          _buildMenuItem(context, "المشاريع", ProjectsPage()),
          _buildMenuItem(context, "الأفكار", IdeasPage()),
          _buildMenuItem(context, "الدورات", Courses()),
          _buildMenuItem(context, "طلبات المستخدمين", UserRequest()),
          _buildMenuItem(context, "أكثر المستخدمين نشاطًا", ActiveUsers()),
          _buildMenuItem(context, "الفيد باك", FeedbackPage()),
          _buildMenuItem(context, "المنح", Grantpage()),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        SizedBox(height: 20),
        _buildAddCourseButton(context), // زر إضافة دورة
        SizedBox(height: 20),
        Expanded(child: _buildCoursesTable(context)),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFF2B2B2B),
      ),
      child: Row(
        children: [
          Spacer(),
          _buildSearchBar(),
          SizedBox(width: 20),
          ProfileCard(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          hintText: "بحث",
          hintStyle: TextStyle(color: Colors.white54),
          fillColor: Color(0xFF4A4A4A),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.white54),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildAddCourseButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0), // مسافة بين الزر والحافة اليمنى
        child: GestureDetector(
          onTap: () {
            _showAddCourseDialog(context);
          },
          child: Container(
            width: 120, // عرض الزر
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "إضافة دورة",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAddCourseDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    final TextEditingController endDateController = TextEditingController();
    final TextEditingController instructorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("إضافة دورة جديدة", style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // تقليل زوايا المستطيل
          ),
          backgroundColor: Color(0xFF3A3A3A), // لون خلفية الفورم
          content: SingleChildScrollView(
            child: Container(
              width: 400, // زيادة عرض الفورم
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    style: TextStyle(color: Colors.white), // لون النص
                    decoration: InputDecoration(
                      hintText: "اسم الدورة",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF4A4A4A), // لون خلفية الحقول
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    style: TextStyle(color: Colors.white), // لون النص
                    decoration: InputDecoration(
                      hintText: "الوصف",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF4A4A4A),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: startDateController,
                    style: TextStyle(color: Colors.white), // لون النص
                    decoration: InputDecoration(
                      hintText: "تاريخ البدء",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF4A4A4A),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: endDateController,
                    style: TextStyle(color: Colors.white), // لون النص
                    decoration: InputDecoration(
                      hintText: "تاريخ الانتهاء",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF4A4A4A),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: instructorController,
                    style: TextStyle(color: Colors.white), // لون النص
                    decoration: InputDecoration(
                      hintText: "اسم المدرب",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Color(0xFF4A4A4A),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text("إلغاء", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("إضافة", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  courses.add({
                    'name': nameController.text,
                    'description': descriptionController.text,
                    'start_date': startDateController.text,
                    'end_date': endDateController.text,
                    'instructor': instructorController.text,
                    'participants': '0', // يمكن تعديل هذا حسب الحاجة
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCoursesTable(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('اسم الدورة', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('الوصف', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('تاريخ البدء', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('تاريخ الانتهاء', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('المدرب', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('عدد المشاركين', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('الإجراءات', style: TextStyle(color: Colors.white))),
        ],
        rows: courses.map<DataRow>((course) {
          return DataRow(cells: [
            DataCell(Text(course['name']!, style: TextStyle(color: Colors.white))),
            DataCell(Text(course['description']!, style: TextStyle(color: Colors.white))),
            DataCell(Text(course['start_date']!, style: TextStyle(color: Colors.white))),
            DataCell(Text(course['end_date']!, style: TextStyle(color: Colors.white))),
            DataCell(Text(course['instructor']!, style: TextStyle(color: Colors.white))),
            DataCell(Text(course['participants']!, style: TextStyle(color: Colors.white))),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    // منطق لتحرير الدورة
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // منطق لحذف الدورة
                  },
                ),
                IconButton(
                  icon: Icon(Icons.visibility, color: Colors.orange),
                  onPressed: () {
                    // منطق لعرض تفاصيل الدورة
                  },
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFF4A4A4A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/defaultpfp.jpg"),
            radius: 19,
          ),
          SizedBox(width: 10.0),
          Text(
            "اسم الادمن",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}