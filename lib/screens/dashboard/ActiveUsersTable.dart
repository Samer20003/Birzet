import 'package:flutter/material.dart';
import 'Courses.dart';
import 'Dashboard.dart';
import 'FeedbackPage.dart';
import 'Grants.dart';
import 'IdeasPage.dart';
import 'Notifications.dart';
import 'ProjectsPage.dart';
import 'UserRequestTable.dart';
import 'UsersPage.dart';

class ActiveUsers extends StatelessWidget {
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
          _buildMenuItem(context, "المنح", Grantpage()),
          _buildMenuItem(context, "الاشعارات", Notifications()),


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
        Expanded(
          child: Row(
            children: [
              Expanded(child: UserActivityTable()), // عرض جدول النشاط
              _buildUserActivityBoxes(), // عرض مربعات النشاط
            ],
          ),
        ),
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

  Widget _buildUserActivityBoxes() {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityBox("صفحة المشاريع", Colors.blue, 70),
          _buildActivityBox("صفحة الأفكار", Colors.green, 50),
          _buildActivityBox("صفحة الدورات", Colors.orange, 30),
          _buildActivityBox("صفحة الاستثمار", Colors.red, 90),
        ],
      ),
    );
  }

  Widget _buildActivityBox(String title, Color color, double percentage) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.white54,
            color: Colors.white,
          ),
          SizedBox(height: 4),
          Text(
            "${percentage.toStringAsFixed(0)}% من الزيارات",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class UserActivityTable extends StatelessWidget {
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
              columnSpacing: 8,
              horizontalMargin: 10,
              dataRowHeight: 48,
              columns: [
                DataColumn(label: Container(width: 100, child: Text("اسم المستخدم", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 150, child: Text("البريد الإلكتروني", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 100, child: Text("عدد الأنشطة", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 150, child: Text("تاريخ آخر نشاط", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 100, child: Text("مستوى النشاط", style: TextStyle(color: Colors.white)))),
              ],
              rows: [
                _createRow("مستخدم 1", "user1@example.com", 20, "2024-12-01", "نشط"),
                _createRow("مستخدم 2", "user2@example.com", 15, "2024-12-02", "متوسط"),
                _createRow("مستخدم 3", "user3@example.com", 5, "2024-12-03", "قليل"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow _createRow(String username, String email, int activities, String lastActivityDate, String activityLevel) {
    return DataRow(cells: [
      DataCell(Text(username, style: TextStyle(color: Colors.white))),
      DataCell(Text(email, style: TextStyle(color: Colors.white))),
      DataCell(Text(activities.toString(), style: TextStyle(color: Colors.white))),
      DataCell(Text(lastActivityDate, style: TextStyle(color: Colors.white))),
      DataCell(Text(activityLevel, style: TextStyle(color: Colors.white))),
    ]);
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