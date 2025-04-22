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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ConstantColors.appTabBarBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add',
          style: TextStyle(
            color: ConstantColors.appBarTitlesColor,
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontSize: ConstantIntegers.selectedTabText,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            color: ConstantColors.notificationIconColor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 26, right: 36, top: 16),
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
                  'Fill the details:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Customer ID:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Customer - 007",
                        hintStyle: TextStyle(
                          fontSize: 16,
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
                    'Customer - 007',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Vehicle Type:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(width: 37),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Sedan",
                              hintStyle: TextStyle(
                                fontSize: 16,
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
                        'Vehicle Number:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "MH36A6678",
                              hintStyle: TextStyle(
                                fontSize: 16,
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
                        borderRadius: BorderRadius.circular(
                          5,
                        ), // Set your desired radius
                      ),
                    ),
                    child: Text(
                      '+ Add',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                  'Total Count: 1',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
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
