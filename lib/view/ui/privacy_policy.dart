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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontFamily: ConstantVariables.fontFamilyPoppins,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
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
                        SizedBox(height: 20),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                ConstantVariables.fontFamilyPoppinsBlack,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Last Updated February 4th, 2025',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                ConstantVariables.fontFamilyPoppinsBlack,
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
                  SizedBox(height: 0),
                  Divider(color: Colors.grey, thickness: 1.0),
                  SizedBox(height: 4),
                  Text(
                    'Table of Contents',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildNumberedItem(1, 'Introduction'),
                        buildNumberedItem(2, 'Information We Collect'),
                        buildNumberedItem(3, 'How We Use Your Information'),
                        buildNumberedItem(4, 'Sharing Your Information'),
                        buildNumberedItem(5, 'Data Security'),
                        buildNumberedItem(6, 'Your Privacy Rights'),
                        buildNumberedItem(7, "Children's Privacy"),
                        buildNumberedItem(8, 'Third-Party Links and Services'),
                        buildNumberedItem(9, 'Changes to this Privacy Policy'),
                        buildNumberedItem(10,'Contact Us'),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 1.0),
                  SizedBox(height: 10),
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
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
          ),
        ),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points.map((text) => bulletPoint(text)).toList(),
        ),

      ],
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(Icons.circle, size: 8, color: Colors.grey),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
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
              fontSize: 16,
              fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 16,
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
