import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import 'package:hb/view/ui/tabBar/main_home/home.dart';
import 'package:hb/view/ui/splashscreen/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantVariables.title,
      home: FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          } else {
            if (snapshot.data != null) {
              final userRole = snapshot.data as int;
              return HomePage(userRole: userRole);
            } else {
              return const SplashPage();
            }
          }
        },
      ),
    );
  }

  Future<int?> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      return prefs.getInt('userRole');
    }
    return null;
  }
}