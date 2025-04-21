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
            onPressed: () {
              // Add notification functionality if required
            },
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Last Updated February 4th, 2025',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                    ],
                  ),
                ),
                // Image Section
                SizedBox(width: 10),
                Image.asset(
                  ConstantImages.assetImages + ConstantImages.iParkLogo,
                  height: ConstantIntegers.privacyScreenLogoHeight,
                  width: ConstantIntegers.privacyScreenLogoWidth,
                  color: ConstantColors.loginLogoColor,
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
