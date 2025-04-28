import 'package:flutter/material.dart';
import 'package:hb/view/ui/tabBar/main_home/home.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_integers.dart';
import '../../../constants/constant_variables.dart';

class VehicleEntry {
  String? type;
  TextEditingController numberController = TextEditingController();
  bool isEditable;

  VehicleEntry({this.isEditable = true});
}

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => AddCustomerScreenState();
}

class AddCustomerScreenState extends State<AddCustomerScreen> {
  final List<VehicleEntry> vehicleEntries = [VehicleEntry()];
  final List<Map<String, String>> registeredVehicles = [];

  final List<String> vehicleTypes = [
    'Sedan',
    'SUV',
    'Truck',
    'Coupe',
    'Hatchback',
    'Convertible',
    'Minivan',
  ];

  void addVehicleEntry() {
    if (vehicleEntries.isNotEmpty) {
      final entry = vehicleEntries.last;
      if (entry.type != null && entry.numberController.text.isNotEmpty) {
        registeredVehicles.add({
          'type': entry.type!,
          'number': entry.numberController.text,
        });

        entry.type = null;
        entry.numberController.clear();

        setState(() {});
      }
    }
  }

  void submitEntries() {
    bool allFilled = true;
    for (var entry in vehicleEntries) {
      if (entry.type == null ||
          entry.type!.isEmpty ||
          entry.numberController.text.isNotEmpty) {
        allFilled = false;
        break;
      }
    }

    if (allFilled) {
      for (var entry in vehicleEntries) {
        print('Type: ${entry.type}, Number: ${entry.numberController.text}');
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('All entries submitted!')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(userRole: 0)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields!')));
    }
  }

  @override
  void dispose() {
    for (var entry in vehicleEntries) {
      entry.numberController.dispose();
    }
    super.dispose();
  }

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
          onPressed: () => Navigator.pop(context),
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
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: null,
                    hint: Text(
                      ConstantVariables.customerHintText,
                      style: TextStyle(
                        fontSize: ConstantIntegers.customerHintTextFontSize,
                        color: ConstantColors.customerHintTextColor,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Customer 1',
                        child: Text('Customer 007'),
                      ),
                      DropdownMenuItem(
                        value: 'Customer 2',
                        child: Text('Customer 008'),
                      ),
                      DropdownMenuItem(
                        value: 'Customer 3',
                        child: Text('Customer 009'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: ConstantIntegers.containerSizedBox),
            Expanded(
              child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                itemCount: vehicleEntries.length,
                itemBuilder: (context, index) {
                  final entry = vehicleEntries[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(
                        ConstantIntegers.containerPaddingAll,
                      ),
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
                                  fontSize:
                                      ConstantIntegers.vehicleTypeTextFontSize,
                                  color: ConstantColors.vehicleTypeColorText,
                                  fontFamily:
                                      ConstantVariables.fontFamilyPoppins,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: ConstantIntegers.vehicleTypeSizedBox,
                              ),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  dropdownColor: Colors.white,
                                  value: entry.type,
                                  hint: Text(
                                    ConstantVariables.vehicleTypeHintText,
                                    style: TextStyle(
                                      fontSize:
                                          ConstantIntegers
                                              .vehicleTypeHintTextFontSize,
                                      color:
                                          ConstantColors.vehicleNameColorText,
                                      fontFamily:
                                          ConstantVariables.fontFamilyPoppins,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  items:
                                      vehicleTypes.map((String vehicle) {
                                        return DropdownMenuItem<String>(
                                          value: vehicle,
                                          child: Text(vehicle),
                                        );
                                      }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      entry.type = newValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                ConstantIntegers.vehicleTextBelowSizedBoxHeight,
                          ),
                          Row(
                            children: [
                              Text(
                                ConstantVariables.vehicleNumberText,
                                style: TextStyle(
                                  fontSize:
                                      ConstantIntegers.vehicleNoTextFontSize,
                                  color: ConstantColors.vehicleNumberColorText,
                                  fontFamily:
                                      ConstantVariables.fontFamilyPoppins,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width:
                                    ConstantIntegers
                                        .vehicleNoTextBelowSizedBoxWidth,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height:
                                      ConstantIntegers
                                          .vehicleNoHintTextAboveSizedBoxHeight,
                                  child: TextField(
                                    controller: entry.numberController,
                                    decoration: InputDecoration(
                                      hintText:
                                          ConstantVariables
                                              .vehicleNumberHintText,
                                      hintStyle: TextStyle(
                                        fontSize:
                                            ConstantIntegers
                                                .vehicleNoHintTextFontSize,
                                        color:
                                            ConstantColors.vehicleNumberColor,
                                        fontFamily:
                                            ConstantVariables.fontFamilyPoppins,
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
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: addVehicleEntry,
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
                ],
              ),
            ),
            SizedBox(height: 10),
            // Display registered vehicles
            Text(
              'Registered Vehicles',
              style: TextStyle(
                fontSize: ConstantIntegers.fillDetailsTextFontSize,
                fontWeight: FontWeight.bold,
                color: ConstantColors.detailsTextColor,
                fontFamily: ConstantVariables.fontFamilyPoppins,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: registeredVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = registeredVehicles[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(
                        ConstantIntegers.containerPaddingAll,
                      ),
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
                                  fontSize:
                                      ConstantIntegers.vehicleTypeTextFontSize,
                                  color: ConstantColors.vehicleTypeColorText,
                                  fontFamily:
                                      ConstantVariables.fontFamilyPoppins,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 30),

                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                    text: vehicle['type'],
                                  ),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText:
                                        ConstantVariables.vehicleTypeHintText,
                                    hintStyle: TextStyle(
                                      fontSize:
                                          ConstantIntegers
                                              .vehicleTypeHintTextFontSize,
                                      color:
                                          ConstantColors.vehicleNameColorText,
                                      fontFamily:
                                          ConstantVariables.fontFamilyPoppins,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: ConstantIntegers.textBelowSizedBox),
                          Row(
                            children: [
                              Text(
                                ConstantVariables.vehicleNumberText,
                                style: TextStyle(
                                  fontSize:
                                      ConstantIntegers.vehicleNoTextFontSize,
                                  color: ConstantColors.vehicleNumberColorText,
                                  fontFamily:
                                      ConstantVariables.fontFamilyPoppins,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width:
                                    ConstantIntegers
                                        .vehicleNoTextBelowSizedBoxWidth,
                              ),

                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                    text: vehicle['number'],
                                  ),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText:
                                        ConstantVariables.vehicleNumberHintText,
                                    hintStyle: TextStyle(
                                      fontSize:
                                          ConstantIntegers
                                              .vehicleNoHintTextFontSize,
                                      color: ConstantColors.vehicleNumberColor,
                                      fontFamily:
                                          ConstantVariables.fontFamilyPoppins,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${ConstantVariables.totalCountText}: ${registeredVehicles.length}',
                  style: TextStyle(
                    color: ConstantColors.totalCountColorText,
                    fontSize: ConstantIntegers.totalCountTextFontSize,
                  ),
                ),
                ElevatedButton(
                  onPressed: submitEntries,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ConstantIntegers.addButtonEdgeCircular,
                      ),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ConstantIntegers.addButtonTextFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
