import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_variables.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_integers.dart';

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
      backgroundColor: ConstantColors.defaultDashBoardColour,
      appBar: AppBar(
        backgroundColor: ConstantColors.chatContentAppBar,
        leading: appBarLeading(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_car_outlined,
              size: ConstantIntegers.chatCarSize,
              color: ConstantColors.homeScreenCarIconColor,
            ),
            SizedBox(width: ConstantIntegers.chatIconPadding),
            Text(
              widget.carNumber,
              style: TextStyle(
                fontSize: ConstantIntegers.chatCarNoAppbar,
                fontWeight: FontWeight.bold,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                color: ConstantColors.chatContentCarNoAppBar,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: ConstantColors.chatContentNotification,
              size: ConstantIntegers.notificationSize,
            ),
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
          icon: Icon(Icons.arrow_back_ios, color: ConstantColors.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
