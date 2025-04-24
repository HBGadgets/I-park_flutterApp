import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import 'package:hb/view/ui/home.dart';
import 'package:hb/view/ui/login.dart';
import 'package:hb/view/ui/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:hb/controller/user_login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
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
            return snapshot.data == true ? const HomePage() : const LoginPage();
          }
        },
      ),
    );
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }
}