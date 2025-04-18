import 'package:flutter/material.dart';
import 'package:hb/view/constants/constants_images.dart';
import 'package:hb/view/constants/constants_variables.dart';
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
                image: AssetImage(ConstantsImages.assetImages + ConstantsImages.backgroundCarImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xDB0C0C15), Colors.transparent],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                ConstantsImages.assetImages + ConstantsImages.iParkLogo,
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
                  ConstantsImages.assetImages + ConstantsImages.slideButtonCarLogo,
                ),
                foregroundColor: Colors.black,
                text: ConstantsVariables.getStartedText,
                textStyle: TextStyle(
                  fontFamily: ConstantsVariables.fontFamilyPoppins,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
