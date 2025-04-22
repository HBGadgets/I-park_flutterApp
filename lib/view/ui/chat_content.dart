import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';

class ChatContent extends StatefulWidget {
  final String carNumber;

  const ChatContent({super.key, required this.carNumber});

  @override
  ChatContentScreen createState() => ChatContentScreen();
}

class ChatContentScreen extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: appBarLeading(),
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car_outlined
            ),
            SizedBox(width: 10),
            Text(
              widget.carNumber,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget appBarLeading() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
