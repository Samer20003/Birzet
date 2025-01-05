import 'package:flutter/material.dart';
import 'ActiveUsersTable.dart';
import 'Courses.dart';
import 'Dashboard.dart';
import 'IdeasPage.dart';
import 'ProjectsPage.dart';
import 'UserRequestTable.dart';
import 'UsersPage.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B), // تغيير لون الخلفية هنا
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
    return Center(
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: FeedbackTable()), // إضافة الجدول هنا
        ],
      ),
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
}

class FeedbackTable extends StatefulWidget {
  @override
  _FeedbackTableState createState() => _FeedbackTableState();
}

class _FeedbackTableState extends State<FeedbackTable> {
  List<bool> _isNoteOpen = [false, false, false]; // مصفوفة لتتبع حالة الفتح لكل ملاحظة

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF4A4A4A), // لون خلفية الجدول
              borderRadius: BorderRadius.circular(8),
            ),
            child: DataTable(
              columnSpacing: 16, // إضافة مسافة بين الأعمدة
              horizontalMargin: 10,
              dataRowHeight: 48,
              columns: [
                DataColumn(label: Text("اسم المستخدم", style: TextStyle(color: Colors.white))),
                DataColumn(label: Text("البريد الإلكتروني", style: TextStyle(color: Colors.white))),
                DataColumn(label: Text("التاريخ", style: TextStyle(color: Colors.white))),
                DataColumn(label: Text("الملاحظات", style: TextStyle(color: Colors.white))),
                DataColumn(label: Text("الإجراءات", style: TextStyle(color: Colors.white))),
              ],
              rows: [
                _createRow(0, "مستخدم 1", "user1@example.com", "2024-12-01", 5, "ملاحظات مفيدة"),
                _createRow(1, "مستخدم 2", "user2@example.com", "2024-12-02", 4, "تجربة جيدة"),
                _createRow(2, "مستخدم 3", "", "2024-12-03", 3, "يمكن تحسين الخدمة"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow _createRow(int index, String username, String email, String date, int rating, String notes) {
    return DataRow(cells: [
      DataCell(Text(username, style: TextStyle(color: Colors.white))),
      DataCell(Text(email, style: TextStyle(color: Colors.white))),
      DataCell(Text(date, style: TextStyle(color: Colors.white))),
      DataCell(Text(rating.toString(), style: TextStyle(color: Colors.white))),
      DataCell(
        GestureDetector(
          onTap: () {
            setState(() {
              _isNoteOpen[index] = !_isNoteOpen[index];
            });
            _showNoteDialog(context, username, notes);
          },
          child: Text(
            "ملاحظة",
            style: TextStyle(
              color: _isNoteOpen[index] ? Colors.green : Colors.red,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      DataCell(
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                // إضافة منطق التعديل هنا
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // إضافة منطق الحذف هنا
              },
            ),
          ],
        ),
      ),
    ]);
  }

  void _showNoteDialog(BuildContext context, String username, String note) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFE0E0E0), // لون خلفية الصندوق
          title: Text("ملاحظة من $username"),
          content: Text(note),
          actions: [
            TextButton(
              child: Text("إغلاق"),
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الصندوق
              },
            ),
          ],
        );
      },
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