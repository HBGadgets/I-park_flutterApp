import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

import 'login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageScreen createState() => SplashPageScreen();
}

class SplashPageScreen extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/planewhite.png",
                  height: 398,
                  width: 398,
                ),
                SizedBox(height: 270),
                ConfirmationSlider(
                  onConfirmation: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  sliderButtonContent: Image.asset(
                    "assets/images/irix.logo.png",
                  ),
                  foregroundColor: Colors.black,
                  text: " Get Started  > > > ",
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
