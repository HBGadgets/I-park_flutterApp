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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.detailsTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  ConstantVariables.customerIDText,
                  style: TextStyle(
                    fontSize: 16,
                    color: ConstantColors.customerIDTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: ConstantVariables.customerHintText,
                        hintStyle: TextStyle(
                          fontSize: 16,
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
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.customerNameText,
                    style: TextStyle(
                      fontSize: 16,
                      color: ConstantColors.customerNameTextColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        ConstantVariables.vehicleTypeText,
                        style: TextStyle(
                          fontSize: 16,
                          color: ConstantColors.vehicleTypeColorText,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(width: 37),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ConstantVariables.vehicleTypeHintText,
                              hintStyle: TextStyle(
                                fontSize: 16,
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
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        ConstantVariables.vehicleNumberText,
                        style: TextStyle(
                          fontSize: 16,
                          color: ConstantColors.vehicleNumberColorText,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: ConstantVariables.vehicleNumberHintText,
                              hintStyle: TextStyle(
                                fontSize: 16,
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 107,
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      ConstantVariables.addButtonText,
                      style: TextStyle(
                        color: ConstantColors.addButtonTTextColor,
                        fontSize: 16,
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
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
