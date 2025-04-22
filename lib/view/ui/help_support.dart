import 'package:flutter/material.dart';

import '../constants/constant_variables.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Help & Support',
          style: TextStyle(
            color: Colors.white,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We Provide 24x 7 Support",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 44,
                width: 357,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Search for help",
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What is ipark?",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How it is beneficial? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How to Scan QR?",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How to  inform valley boy?",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined, size: 30),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Need more help? Our support team members are here to help you",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 44,
                width: 351,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xA3DFF7F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_pin_rounded),
                        SizedBox(width: 8),
                        Text(
                          "Call Support Team",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold,
                            color: Color(0xFF454B60)
                            ,
                          ),
                        ),
                      ],
                    ),

                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 44,
                width: 351,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xA3DFF7F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/image 145.png"),
                        SizedBox(width: 8),
                        Text(
                          "Chat with us",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold,
                            color: Color(0xFF454B60),
                          ),
                        ),
                      ],
                    ),

                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 44,
                width: 351,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xA3DFF7F9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/image 146.png"),
                        SizedBox(width: 8),
                        Text(
                          "Raise the ticket ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold,
                            color: Color(0xFF454B60),
                          ),
                        ),
                      ],
                    ),

                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/plane white.png",
                    color: Colors.black,
                    height: 145,
                    width: 145,
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
