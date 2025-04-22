import 'package:flutter/material.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';
import 'add_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  HomeTabScreen createState() => HomeTabScreen();
}

class HomeTabScreen extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [qrContent(), recentChatsHeader(), chatsList()]),
      backgroundColor: ConstantColors.defaultDashBoardColour,
    );
  }

  Widget qrContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(ConstantIntegers.qrContainerPadding),
        child: Container(
          height: ConstantIntegers.containerHeight,
          width: ConstantIntegers.containerWidth,
          padding: const EdgeInsets.all(ConstantIntegers.qrColumnPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ConstantIntegers.qrContainerRadius,
            ),
            border: Border.all(
              color: ConstantColors.homeTabBorderColor,
              width: ConstantIntegers.qrContainerBorder,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      ConstantImages.assetImages +
                          ConstantImages.circularAvatarImage,
                    ),
                    radius: ConstantIntegers.qrCircularAvatarRadius,
                  ),
                  const SizedBox(width: ConstantIntegers.qrTextSizedBox),
                  const Text(
                    ConstantVariables.homePersonNameText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.usernameFontHome,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                      color: ConstantColors.homeScreenPersonNameTextColor,
                    ),
                  ),
                ],
              ),
              Image.asset(
                ConstantImages.assetImages + ConstantImages.qrImage,
                width: ConstantIntegers.qrImageWidth,
                height: ConstantIntegers.qrImageHeight,
              ),
              const Text(
                ConstantVariables.scanQRText,
                style: TextStyle(
                  color: ConstantColors.scanQrTextColor,
                  fontSize: ConstantIntegers.scanQRFontSize,
                  fontFamily: ConstantVariables.fontFamilyPoppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentChatsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          ConstantVariables.recentText,
          style: TextStyle(
            color: ConstantColors.recentChatsTextColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: ConstantIntegers.recentSpace),
      ],
    );
  }

  Widget chatsList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: ConstantIntegers.chatPaddingLeft,
          right: ConstantIntegers.chatPaddingRight,
        ),
        child: ListView(
          padding: EdgeInsets.all(ConstantIntegers.listViewPadding),
          children: [
            chatRow(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
            chatRow(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
            chatRow(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget chatRow() {
    return Row(
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
                ),
                SizedBox(width: ConstantIntegers.chatIconPadding),
                Text(
                  ConstantVariables.customerNo,
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
              ConstantVariables.request,
              style: TextStyle(
                fontSize: ConstantIntegers.chatSize,
                color: ConstantColors.homeScreenCarMessageTextColor,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCustomerScreen()),
            );
          },
          icon: Icon(Icons.add_circle, size: 31, color: Colors.black),
        ),
      ],
    );
  }
}
