import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.defaultDashBoardColour,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ConstantColors.arrowBackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          ConstantVariables.helpSupport,
          style: TextStyle(
            color: ConstantColors.appBarTitlesColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: ConstantColors.appTabBarBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: ConstantColors.notificationIconColor,
              size: ConstantIntegers.notificationSize,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: ConstantColors.defaultDashBoardColour,
        margin: EdgeInsets.all(ConstantIntegers.mainContainerMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headline(),
              SizedBox(height: ConstantIntegers.headlineSearchSizedBox),
              searchField(),
              SizedBox(height: ConstantIntegers.searchQuestionSizedBox),
              questionSection(),
              SizedBox(height: ConstantIntegers.questionHelpSizedBox),
              helpMessage(),
              SizedBox(height: ConstantIntegers.questionHelpSizedBox),
              helpButton(
                ConstantVariables.callSupport,
                Icons.person_pin_rounded,
              ),
              SizedBox(height: ConstantIntegers.helpSupportSpace),
              helpButton(
                ConstantVariables.chatUs,
                ConstantImages.assetImages + ConstantImages.chat,
              ),
              SizedBox(height: ConstantIntegers.helpSupportSpace),
              helpButton(
                ConstantVariables.ticketRaise,
                ConstantImages.assetImages + ConstantImages.ticket,
              ),
              SizedBox(height: ConstantIntegers.imageSpacer),
              helpImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headline() {
    return Text(
      ConstantVariables.provideSupport,
      style: TextStyle(
        fontSize: ConstantIntegers.headlineFontSize,
        fontWeight: FontWeight.w900,
        fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
        color: ConstantColors.aboutUsDetails,
      ),
    );
  }

  Widget searchField() {
    return SizedBox(
      height: ConstantIntegers.searchTextFieldHeight,
      width: ConstantIntegers.searchTextFieldWidth,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ConstantIntegers.searchTextFieldRadius,
            ),
          ),
          hintText: ConstantVariables.searchHelp,
          hintStyle: TextStyle(color: ConstantColors.aboutUsDetails),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget questionSection() {
    final faqs = [
      ConstantVariables.what,
      ConstantVariables.beneficial,
      ConstantVariables.scanToScan,
      ConstantVariables.inform,
    ];

    return Column(
      children:
          faqs.map((faq) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ConstantIntegers.supportContainerPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    faq,
                    style: TextStyle(
                      fontSize: ConstantIntegers.supportTextFont,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: ConstantColors.aboutUsDetails,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: ConstantIntegers.downArrow,
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget helpMessage() {
    return Text(
      ConstantVariables.needMoreHelp,
      style: TextStyle(
        fontSize: ConstantIntegers.needMoreHelpFont,
        fontWeight: FontWeight.w900,
        fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
        color: ConstantColors.aboutUsDetails,
      ),
    );
  }

  Widget helpButton(String title, dynamic icon) {
    return Container(
      height: ConstantIntegers.helpContainerHeight,
      width: ConstantIntegers.helpContainerWidth,
      padding: EdgeInsets.all(ConstantIntegers.helpContainerPadding),
      decoration: BoxDecoration(
        color: ConstantColors.supportContainer,
        borderRadius: BorderRadius.circular(
          ConstantIntegers.helpContainerRadius,
        ),
        border: Border.all(
          color: ConstantColors.supportContainerBorder,
          width: ConstantIntegers.helpContainerBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon is String ? Image.asset(icon) : Icon(icon),
              SizedBox(width: ConstantIntegers.helpContainerSizedBox),
              Text(
                title,
                style: TextStyle(
                  fontSize: ConstantIntegers.helpContainerText,
                  fontFamily: ConstantVariables.fontFamilyPoppins,
                  fontWeight: FontWeight.bold,
                  color: ConstantColors.aboutUsDetails,
                ),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  Widget helpImage() {
    return Center(
      child: Image.asset(
        ConstantImages.assetImages + ConstantImages.iParkLogo,
        color: ConstantColors.loginLogoColor,
        height: ConstantIntegers.helpSupportImageHeight,
        width: ConstantIntegers.helpSupportImageWidth,
      ),
    );
  }
}
