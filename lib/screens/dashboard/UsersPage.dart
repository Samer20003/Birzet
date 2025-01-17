import 'package:flutter/material.dart';
import 'ActiveUsersTable.dart';
import 'Courses.dart';
import 'Dashboard.dart';
import 'FeedbackPage.dart';
import 'Grants.dart';
import 'IdeasPage.dart';
import 'ProjectsPage.dart';
import 'UserRequestTable.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B), // لون الخلفية
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
        Expanded(child: _buildUserTable()), // إضافة الجدول هنا
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

  Widget _buildUserTable() {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('اسم المستخدم', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('البريد الإلكتروني', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('تاريخ التسجيل', style: TextStyle(color: Colors.white))),
          DataColumn(label: Text('الحالة', style: TextStyle(color: Colors.white))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('أحمد', style: TextStyle(color: Colors.white))),
            DataCell(Text('ahmed@example.com', style: TextStyle(color: Colors.white))),
            DataCell(Text('01/01/2022', style: TextStyle(color: Colors.white))),
            DataCell(Text('نشط', style: TextStyle(color: Colors.green))),
          ]),
          DataRow(cells: [
            DataCell(Text('فاطمة', style: TextStyle(color: Colors.white))),
            DataCell(Text('fatima@example.com', style: TextStyle(color: Colors.white))),
            DataCell(Text('02/02/2022', style: TextStyle(color: Colors.white))),
            DataCell(Text('غير نشط', style: TextStyle(color: Colors.red))),
          ]),
          // يمكنك إضافة المزيد من الصفوف هنا
        ],
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