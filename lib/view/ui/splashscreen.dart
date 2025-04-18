import 'package:flutter/material.dart';
import 'package:hb/view/constants/constants_images.dart';
import 'package:hb/view/constants/constants_integers.dart';
import 'package:hb/view/constants/constants_variables.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import '../constants/constants_colors.dart';
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
                image: AssetImage(
                  ConstantImages.assetImages +
                      ConstantImages.backgroundCarImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ConstantColors.backgroundGradientColor, ConstantColors.backgroundGradientTransparent],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Image.asset(
                ConstantImages.assetImages + ConstantImages.iParkLogo,
                height: ConstantIntegers.iParkLogoHeight,
                width: ConstantIntegers.iParkLogoWidth
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
                  ConstantImages.assetImages +
                      ConstantImages.slideButtonCarLogo,
                ),
                foregroundColor: ConstantColors.sliderButtonForegroundColor,
                text: ConstantVariables.getStartedText,
                textStyle: TextStyle(
                  fontFamily: ConstantVariables.fontFamilyPoppins,
                  fontSize: ConstantIntegers.getStartedTextFontSize,
                  fontWeight: FontWeight.bold,
                  color: ConstantColors.getStartedTextColor,
                ),
                backgroundColor: ConstantColors.confirmationSliderBackgroundColor,
              ),
              const SizedBox(height: ConstantIntegers.confirmationSliderSizedBoxWidth),
            ],
          ),
        ],
      ),
    );
  }
}
