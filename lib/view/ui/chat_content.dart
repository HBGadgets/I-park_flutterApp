import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car_outlined,
              color: ConstantColors.homeScreenCarIconColor,
            ),
            SizedBox(width: ConstantIntegers.chatIconPadding),
            Text(widget.carNumber),
            SizedBox(width: ConstantIntegers.chatIconPadding),
            SizedBox(width: ConstantIntegers.chatIconPadding),
          ],
        ),
        centerTitle: true,
        actions: [Icon(Icons.notifications, color: Colors.black, size: 31)],
      ),
    );
  }
}
