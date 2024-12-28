import 'package:flutter/material.dart';
import 'ActiveUsersTable.dart';
import 'Courses.dart';
import 'Dashboard.dart';
import 'FeedbackPage.dart';
import 'IdeasPage.dart';
import 'ProjectsPage.dart';
import 'UsersPage.dart';

class UserRequest extends StatelessWidget {
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
    return Column(
      children: [
        _buildHeader(),
        SizedBox(height: 20),
        Expanded(child: UserRequestTable()), // عرض جدول طلبات المستخدمين
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
}

class UserRequestTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            width: 900,
            decoration: BoxDecoration(
              color: Color(0xFF4A4A4A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DataTable(
              columnSpacing: 8,
              horizontalMargin: 10,
              dataRowHeight: 48,
              columns: [
                DataColumn(label: Container(width: 100, child: Text("اسم المستخدم", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 150, child: Text("طلب التقديم", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 200, child: Text("البريد الإلكتروني", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 150, child: Text("تاريخ التقديم", style: TextStyle(color: Colors.white)))),
                DataColumn(label: Container(width: 120, child: Text("الإجراءات", style: TextStyle(color: Colors.white)))),
              ],
              rows: [
                _createRow(context, "أ", "نشر فكرة", "user1@example.com", "2024-01-01"),
                _createRow(context, "ب", "نشر مشروع", "user2@example.com", "2024-01-02"),
                _createRow(context, "ج", "طلب استثمار", "user3@example.com", "2024-01-03"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow _createRow(BuildContext context, String userInitial, String requestType, String email, String date) {
    Color requestColor;

    switch (requestType) {
      case "نشر فكرة":
        requestColor = Colors.green;
        break;
      case "نشر مشروع":
        requestColor = Colors.blue;
        break;
      case "طلب استثمار":
        requestColor = Colors.orange;
        break;
      default:
        requestColor = Colors.grey;
    }

    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  userInitial,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
              Text("اسم $userInitial", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        DataCell(
          Container(
            width: 150,
            color: requestColor.withOpacity(0.5),
            padding: EdgeInsets.all(8),
            child: Text(requestType, style: TextStyle(color: Colors.white)),
          ),
        ),
        DataCell(
          Text(email, style: TextStyle(color: Colors.white)),
        ),
        DataCell(
          Text(date, style: TextStyle(color: Colors.white)),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.check_circle, color: Colors.green),
                onPressed: () {
                  // هنا يمكنك إضافة عملية قبول الطلب
                },
              ),
              IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  // هنا يمكنك إضافة عملية حذف
                },
              ),
              IconButton(
                icon: Icon(Icons.visibility, color: Colors.blue),
                onPressed: () {
                  // الانتقال إلى صفحة التفاصيل
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserRequest(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
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