import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../Controllers/AuthController.dart';
import 'ActiveUsersTable.dart';
import 'Courses.dart';
import 'FeedbackPage.dart';
import 'Grants.dart';
import 'IdeasPage.dart';
import 'Notifications.dart';
import 'ProjectsPage.dart';
import 'UserRequestTable.dart';
import 'UsersPage.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Expanded(child: _buildCharts()),
        Container(
          height: 60,
          color: Color(0xFF2B2B2B),
          child: Center(
            child: Text(
              "الطلبات المعلقة",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(child: UserRequestTable()),
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

  Widget _buildCharts() {
    return Container(
      color: Color(0xFF2B2B2B),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSmallChart(_buildProjectsChart(), 'عدد المشاريع الناشئة'),
              _buildSmallChart(_buildIdeasChart(), 'عدد الأفكار المضافة'),
              _buildSmallChart(
                  _buildFundedProjectsChart(), 'عدد المشاريع المستفيدة'),
            ],
          ),
          Expanded(
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallChart(Widget chart, String title) {
    return Container(
      width: 250,
      height: 200,
      child: Card(
        color: Color(0xFF4A4A4A),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.white54),
              ),
              Expanded(child: chart),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsChart() {
    final data = [
      FlSpot(0, 5), FlSpot(1, 10), FlSpot(2, 8),
      FlSpot(3, 12), FlSpot(4, 15), FlSpot(5, 6),
      FlSpot(6, 4), FlSpot(7, 9), FlSpot(8, 11),
      FlSpot(9, 13), FlSpot(10, 14), FlSpot(11, 7),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 15,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: Colors.blue, // استخدام color بدلاً من colors
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildIdeasChart() {
    final data = [
      FlSpot(0, 3), FlSpot(1, 7), FlSpot(2, 6),
      FlSpot(3, 9), FlSpot(4, 11), FlSpot(5, 5),
      FlSpot(6, 8), FlSpot(7, 10), FlSpot(8, 12),
      FlSpot(9, 15), FlSpot(10, 14), FlSpot(11, 13),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 15,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: Colors.green, // استخدام color بدلاً من colors
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  Widget _buildFundedProjectsChart() {
    final data = [
      FlSpot(0, 12), FlSpot(1, 10), FlSpot(2, 17),
      FlSpot(3, 8), FlSpot(4, 13), FlSpot(5, 15),
      FlSpot(6, 5), FlSpot(7, 16), FlSpot(8, 14),
      FlSpot(9, 18), FlSpot(10, 13), FlSpot(11, 9),
    ];

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        borderData: FlBorderData(show: true),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 20,
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: Colors.orange, // استخدام color بدلاً من colors
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
class MonthlyData {
  final String month;
  final int count;
  MonthlyData(this.month, this.count);
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

class UserRequestTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B),
      body: SingleChildScrollView(
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
                  _createRow("أ", "نشر فكرة", "user1@example.com", "2024-01-01", context),
                  _createRow("ب", "نشر مشروع", "user2@example.com", "2024-01-02", context),
                  _createRow("ج", "طلب استثمار", "user3@example.com", "2024-01-03", context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DataRow _createRow(String userInitial, String requestType, String email, String date, BuildContext context) {
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