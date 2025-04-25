import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.defaultDashBoardColour,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ConstantVariables.privacyPolicy,
          style: TextStyle(
            color: ConstantColors.appBarTitlesColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColors.arrowBackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ConstantIntegers.privacyPolicyMainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ConstantIntegers.privacySizedBox),
                      Text(
                        ConstantVariables.privacyPolicy,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                          color: ConstantColors.detailsTextColor,
                        ),
                      ),
                      SizedBox(
                        height: ConstantIntegers.privacyLastUpdateSizedBox,
                      ),
                      Text(
                        ConstantVariables.lastUpdate,
                        style: TextStyle(
                          fontSize: ConstantIntegers.subtitleLastUpdate,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  ConstantImages.assetImages + ConstantImages.iParkLogo,
                  height: ConstantIntegers.privacyScreenLogoHeight,
                  width: ConstantIntegers.privacyScreenLogoWidth,
                  color: ConstantColors.loginLogoColor,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: ConstantColors.dividerColors,
                  thickness: ConstantIntegers.dividerThicknessPolicy,
                ),
                SizedBox(height: ConstantIntegers.privacySpacing),
                Text(
                  ConstantVariables.tableContent,
                  style: TextStyle(
                    fontSize: ConstantIntegers.tableHeaderFont,
                    color: Colors.black,
                    fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ConstantIntegers.privacySpacing),
                Padding(
                  padding: const EdgeInsets.only(
                    left: ConstantIntegers.tableContentColumnPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildNumberedItem(1, ConstantVariables.introduction),
                      buildNumberedItem(2, ConstantVariables.information),
                      buildNumberedItem(3, ConstantVariables.use),
                      buildNumberedItem(4, ConstantVariables.sharing),
                      buildNumberedItem(5, ConstantVariables.security),
                      buildNumberedItem(6, ConstantVariables.privacy),
                      buildNumberedItem(7, ConstantVariables.childrenPrivacy),
                      buildNumberedItem(8, ConstantVariables.thirdParty),
                      buildNumberedItem(9, ConstantVariables.changes),
                      buildNumberedItem(10, ConstantVariables.contact),
                    ],
                  ),
                ),
                Divider(
                  color: ConstantColors.dividerColors,
                  thickness: ConstantIntegers.dividerThicknessPolicy,
                ),
                SizedBox(height: ConstantIntegers.tableContentColumnPadding),
                subtitleText("1. Introduction", [
                  "Protecting Your Privacy: Our Commitment to Keeping Your Data Safe",
                  "Understanding Our Privacy Practices",
                  "Your Information, Your Rights: A Guide to Our Privacy Policy",
                ]),
                subtitleText("2. Information We Collect", [
                  "What We Collect and Why: Transparency in Data Collection",
                  "Your Data: How We Gather and Utilize Information",
                  "Information Collection: Providing Insight into Our Practices",
                ]),
                subtitleText("3. How We Use Your Information", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("4. Sharing Your Information", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("5. Data Security", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("6. Your Privacy Rights", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("7. Children's Privacy", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("8. Third-Party Links and Services", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("9. Changes to this Privacy Policy", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
                subtitleText("10. Contact Us", [
                  "Using Your Data to Enhance Your Experience",
                  "Access Restrictions",
                  "Your Information in Action: Improving Services and Personalization",
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget subtitleText(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: ConstantIntegers.subtitleTextFont,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
            color: ConstantColors.iconColor,
          ),
        ),
        SizedBox(height: ConstantIntegers.space),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points.map((text) => bulletPoint(text)).toList(),
        ),
      ],
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: ConstantIntegers.bulletPointRowPaddingLeft,
        bottom: ConstantIntegers.bulletPointRowPaddingBottom,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: ConstantIntegers.bulletPointRowPaddingTop,
            ),
            child: Icon(
              Icons.circle,
              size: ConstantIntegers.bulletCircle,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: ConstantIntegers.helpContainerSizedBox),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: ConstantIntegers.bulletContent,
                color: Colors.grey,
                fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumberedItem(int number, String title) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$number. ",
            style: TextStyle(
              fontSize: ConstantIntegers.numberText,
              fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: ConstantIntegers.titleText,
              fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
              decoration: TextDecoration.underline,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
