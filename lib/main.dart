import 'package:bmi_project/constant/constant.dart';
import 'package:bmi_project/screen/ui/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: appBarColor,
          appBarTheme: const AppBarTheme(backgroundColor: appBarColor)),
      home: const BmiScreen(),
    );
  }
}
