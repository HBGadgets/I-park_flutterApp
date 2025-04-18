import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import 'package:hb/view/ui/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantVariables.title,
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
