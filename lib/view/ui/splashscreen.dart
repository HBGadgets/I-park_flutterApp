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
                image: AssetImage("assets/images/chris-lee-70l1tDAI6rM-unsplash.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xDB0C0C15),Colors.transparent],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/planewhite.png",
                height: 398,
                width: 398,
              ),
              const Spacer(),
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
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
