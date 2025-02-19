import 'package:flutter/material.dart';
import 'package:ggg_hhh/constants.dart';
import 'package:ggg_hhh/screens/Welcome/welcome_screen.dart';
import 'package:ggg_hhh/screens/dashboard/Dashboard.dart';
import 'package:ggg_hhh/screens/investor/homepageinvestor/HomePageScreeninvestor.dart';
import 'package:ggg_hhh/screens/users/homepageUsers/HomePageScreenUsers.dart';

void main() => runApp(const MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StartUps Hub',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: homepagescreen(),
    );
  }
}
