import 'package:flutter/material.dart';

import '../constants/constant_colors.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: appBarLeading(),
        title: Text(widget.carNumber),
      ),
    );
  }

  Widget appBarLeading() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.menu, color: ConstantColors.menuIconColor),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );
  }
}