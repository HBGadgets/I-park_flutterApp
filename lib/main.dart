import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import 'package:hb/view/ui/home.dart';
import 'package:hb/view/ui/splashscreen.dart';
import 'package:provider/provider.dart';

import 'controller/user_login_api.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantVariables.title,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
