import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_downloder/Screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'IRANSansDN',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
