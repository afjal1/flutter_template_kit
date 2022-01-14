import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home.dart';
import 'screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template Kit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardingScreen(),
    );
  }
}
