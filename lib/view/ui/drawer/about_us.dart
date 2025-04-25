import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_images.dart';
import '../../constants/constant_integers.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.defaultDashBoardColour,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColors.arrowBackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          ConstantVariables.aboutUsText,
          style: TextStyle(
            color: ConstantColors.appBarTitlesColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ConstantColors.appTabBarBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: ConstantColors.notificationIconColor,
              size: ConstantIntegers.notificationSize,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ConstantIntegers.aboutUsPagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  ConstantImages.assetImages + ConstantImages.iParkLogo,
                  height: ConstantIntegers.irixHeight,
                  width: ConstantIntegers.irixWidth,
                  color: ConstantColors.loginLogoColor,
                ),
              ),
              text(ConstantVariables.welcomeDetails, FontWeight.w400),
              SizedBox(height: ConstantIntegers.aboutUsSizedBox),
              text(ConstantVariables.ourMission, FontWeight.bold),
              SizedBox(height: ConstantIntegers.aboutUsDetailSizedBox),
              text(ConstantVariables.ourMissionDetails),
              SizedBox(height: ConstantIntegers.aboutUsSizedBox),
              text(ConstantVariables.whoWeAre, FontWeight.bold),
              SizedBox(height: ConstantIntegers.aboutUsDetailSizedBox),
              text(ConstantVariables.whoWeAreDetails),
              SizedBox(height: ConstantIntegers.aboutUsSizedBox),
              text(ConstantVariables.contactUsText, FontWeight.bold),
              text(ConstantVariables.questionText),
              SizedBox(height: ConstantIntegers.aboutUsDetailSizedBox),
              contactInfo(),
              SizedBox(height: ConstantIntegers.aboutUsSizedBox),
              socialMediaIcons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget text(String text, [FontWeight fontWeight = FontWeight.normal]) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: ConstantVariables.fontFamilyPoppins,
        fontSize: ConstantIntegers.detailAboutUsTextSize,
        fontWeight: fontWeight,
        color: ConstantColors.aboutUsDetails,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget contactInfo() {
    final contactDetails = [
      ConstantVariables.emailDetailText,
      ConstantVariables.phoneDetailText,
      ConstantVariables.websiteDetailText,
      ConstantVariables.socialDetailText,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          contactDetails.map((detail) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: ConstantIntegers.aboutUsDetailSizedBox,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: ConstantIntegers.bulletCircle,
                    color: Colors.black,
                  ),
                  SizedBox(width: ConstantIntegers.bulletSpaceCircle),
                  Text(
                    detail,
                    style: TextStyle(
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontSize: ConstantIntegers.detailAboutUsTextSize,
                      color: ConstantColors.aboutUsDetails,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget socialMediaIcons() {
    final socialMediaIcons = [
      ConstantImages.instagram,
      ConstantImages.facebook,
      ConstantImages.twitter,
      ConstantImages.whatsapp,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          socialMediaIcons.map((icon) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ConstantIntegers.aboutUsDetailSizedBox,
              ),
              child: Image.asset(
                ConstantImages.assetImages + icon,
                height: ConstantIntegers.socialImageHeight,
                width: ConstantIntegers.socialImageWidth,
                color: ConstantColors.aboutUsIconColor,
              ),
            );
          }).toList(),
    );
  }
}
