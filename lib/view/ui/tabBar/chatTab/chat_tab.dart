import 'package:flutter/material.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_images.dart';
import '../../../constants/constant_integers.dart';
import '../../../constants/constant_variables.dart';
import 'chat_content.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  ChatTabScreen createState() => ChatTabScreen();
}

class ChatTabScreen extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ConstantIntegers.chatChatPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: ConstantIntegers.recentMessagesSpace),
                Text(
                  ConstantVariables.recentMessagesText,
                  style: TextStyle(
                    color: ConstantColors.recentChatsTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                    fontWeight: FontWeight.bold,
                    fontSize: ConstantIntegers.recentFont,
                  ),
                ),
              ],
            ),
            SizedBox(height: ConstantIntegers.recentChatMessagesPadding),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(ConstantIntegers.listViewPadding),
                children: [
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                  chatColumn(),
                  SizedBox(height: ConstantIntegers.chatBelowPadding),
                  Divider(
                    thickness: ConstantIntegers.dividerThickness,
                    color: ConstantColors.homeScreenDividerColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: ConstantColors.defaultDashBoardColour,
    );
  }

  Widget chatColumn() {
    return GestureDetector(
      onTap: () {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ChatContent(carNumber: ConstantVariables.carNo),
            ),
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car_outlined,
                        color: ConstantColors.homeScreenCarIconColor,
                        size: ConstantIntegers.chatCarSize,
                      ),
                      SizedBox(width: ConstantIntegers.chatIconPadding),
                      Text(
                        ConstantVariables.carNo,
                        style: TextStyle(
                          fontSize: ConstantIntegers.homeVehicleFont,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                          color: ConstantColors.homeScreenCarNoTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    ConstantVariables.chatContent,
                    style: TextStyle(
                      fontSize: ConstantIntegers.chatSize,
                      color: ConstantColors.homeScreenCarMessageTextColor,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Image.asset(
                ConstantImages.assetImages + ConstantImages.whatsappVectorImage,
                height: ConstantIntegers.messageWhatsAppHeight,
                width: ConstantIntegers.messageWhatsAppWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
