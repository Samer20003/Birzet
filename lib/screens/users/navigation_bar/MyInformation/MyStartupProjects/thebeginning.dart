import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import 'AddStartupProject.dart';

class thebeginningScreen extends StatefulWidget {
  @override
  _thebeginningScreenState createState() => _thebeginningScreenState();
}

class _thebeginningScreenState extends State<thebeginningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ليس لديك أي مشروع ناشئ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'بإمكانك إضافة مشروع عن طريق الضغط على إنشاء مشروع جديد',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStartupProjectScreen()),
                  );
                },
                child: Text('إنشاء مشروع جديد'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}