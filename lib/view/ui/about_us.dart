import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white,fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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

              Text(
                "Welcome to iPark, the app that transforms the way hotels and guests manage parking. We connect you with valet services at your favorite hotels, making parking and retrieving your vehicle faster, easier, and more convenient than ever before. Whether you're a hotel looking to enhance your guest experience or a traveler who needs quick, seamless parking, iPark is here to help.",
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),
              Text(
                'Our Mission',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'At iPark, our mission is to redefine the parking experience. We aim to simplify and streamline parking for both hotels and guests by leveraging technology to connect them in real-time. We believe that parking should never be a hassle, and through our app, we offer a seamless, efficient, and stress-free solution. Our goal is to ensure every guest enjoys a worry-free stay with the convenience of instant valet service at their fingertips.',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              Text(
                'Who we are:',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'We are a team of innovators passionate about using technology to enhance everyday experiences. Our diverse team comes from backgrounds in hospitality, tech, and customer service, united by a shared vision to solve parking challenges for both businesses and travelers. We work hand-in-hand with hotels to provide top-notch valet services and offer guests an easy, efficient way to schedule parking and retrieve their vehicles—all through a simple, user-friendly app.',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              Text(
                'Contact Us:',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12, fontWeight: FontWeight.bold),
              ),

              Text(
                'Have questions or need assistance? We’re here to help!.',
                style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Email: support@ipark.com', style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Phone: (555) 123-4567', style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Website: www.ipark.com', style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Social Media: @iParkApp', style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontSize: 12)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Instagram.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/Facebook.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/X.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/Vector.png',
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
