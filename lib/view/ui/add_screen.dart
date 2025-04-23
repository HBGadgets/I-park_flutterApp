import 'package:flutter/material.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => AddCustomerScreenState();
}

class AddCustomerScreenState extends State<AddCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.addPageScaffoldColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.appTabBarBackgroundColor,
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
          ConstantVariables.addText,
          style: TextStyle(
            color: ConstantColors.appBarTitlesColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontSize: ConstantIntegers.selectedTabText,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: ConstantIntegers.notificationSize,
            ),
            onPressed: () {},
            color: ConstantColors.notificationIconColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: ConstantIntegers.addColumnPaddingLeft,
          right: ConstantIntegers.addColumnPaddingRight,
          top: ConstantIntegers.addColumnPaddingLeft,
        ),
        child: Column(
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
                  ConstantVariables.fillDetailsText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.fillDetailsTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.detailsTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: ConstantIntegers.customerIDTextAboveSizedBoxHeight,
            ),
            Row(
              children: [
                Text(
                  ConstantVariables.customerIDText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.customerIDTextFontSize,
                    color: ConstantColors.customerIDTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                SizedBox(width: ConstantIntegers.textBetweenSizedBox),
                Expanded(
                  child: SizedBox(
                    height: ConstantIntegers.expandChildSizedBox,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ConstantVariables.customerHintText,
                        hintStyle: TextStyle(
                          fontSize: ConstantIntegers.customerHintTextFontSize,
                          color: ConstantColors.customerHintTextColor,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ConstantIntegers.containerSizedBox),
            Container(
              padding: EdgeInsets.all(ConstantIntegers.containerPaddingAll),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(
                  ConstantIntegers.containerBorderRadiusCircularSize,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.customerNameText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.customerNameTextSize,
                      color: ConstantColors.customerNameTextColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  SizedBox(height: ConstantIntegers.textBelowSizedBox),
                  Row(
                    children: [
                      Text(
                        ConstantVariables.vehicleTypeText,
                        style: TextStyle(
                          fontSize: ConstantIntegers.vehicleTypeTextFontSize,
                          color: ConstantColors.vehicleTypeColorText,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(width: ConstantIntegers.vehicleTypeSizedBox),
                      Expanded(
                        child: SizedBox(
                          height: ConstantIntegers.vehicleSizedBoxHeight,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ConstantVariables.vehicleTypeHintText,
                              hintStyle: TextStyle(
                                fontSize:
                                    ConstantIntegers
                                        .vehicleTypeHintTextFontSize,
                                color: ConstantColors.vehicleNameColorText,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ConstantIntegers.vehicleTextBelowSizedBoxHeight,
                  ),
                  Row(
                    children: [
                      Text(
                        ConstantVariables.vehicleNumberText,
                        style: TextStyle(
                          fontSize: ConstantIntegers.vehicleNoTextFontSize,
                          color: ConstantColors.vehicleNumberColorText,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(
                        width: ConstantIntegers.vehicleNoTextBelowSizedBoxWidth,
                      ),
                      Expanded(
                        child: SizedBox(
                          height:
                              ConstantIntegers
                                  .vehicleNoHintTextAboveSizedBoxHeight,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ConstantVariables.vehicleNumberHintText,
                              hintStyle: TextStyle(
                                fontSize:
                                    ConstantIntegers.vehicleNoHintTextFontSize,
                                color: ConstantColors.vehicleNumberColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ConstantIntegers.vehicleNoHintTextBelowSizedBoxHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: ConstantIntegers.addButtonAboveWidth,
                  height: ConstantIntegers.addButtonAboveHeight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ConstantIntegers.addButtonEdgeCircular,
                        ),
                      ),
                    ),
                    child: Text(
                      ConstantVariables.addButtonText,
                      style: TextStyle(
                        color: ConstantColors.addButtonTTextColor,
                        fontSize: ConstantIntegers.addButtonTextFontSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ConstantVariables.totalCountText,
                  style: TextStyle(
                    color: ConstantColors.totalCountColorText,
                    fontSize: ConstantIntegers.totalCountTextFontSize,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ConstantIntegers.totalCountTextBelowSizedBoxHeight,
            ),
          ],
        ),
      ),
    );
  }
}
