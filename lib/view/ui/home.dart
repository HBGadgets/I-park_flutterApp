import 'package:flutter/material.dart';

import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  int selectedTabIndex = ConstantIntegers.selectedTab;
  final List<String> appBarTitles = [
    ConstantVariables.homeListAppBarTitle,
    ConstantVariables.historyListAppBarTitle,
    ConstantVariables.profileListAppBarTitle,
  ];

  void onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ConstantIntegers.tabBarLength,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text(
            appBarTitles[selectedTabIndex],
            style: TextStyle(
              color: Colors.white,
              fontFamily: ConstantVariables.fontFamilyPoppins,
              fontSize: ConstantIntegers.selectedTabText,
            ),
          ),
          centerTitle: true,
          actions: [Icon(Icons.notifications, color: Colors.white)],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Text(
                  ConstantVariables.menuDrawerHeaderText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                    fontSize: ConstantIntegers.menuText,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  ConstantVariables.menuAboutUsListText,
                  style: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  ConstantVariables.menuSettingsListText,
                  style: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  ConstantVariables.menuLogoutListText,
                  style: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildHomeTab(),
                  buildHistoryTab(),
                  buildProfileTab(),
                ],
              ),
            ),
            Container(
              height: ConstantIntegers.tabBarContainerHeight,
              color: Colors.black,
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                dividerColor: Colors.black,
                onTap: onTabChanged,
                tabs: const [
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: ConstantIntegers.tabBarIcon,
                          color: Colors.white,
                        ),
                        Text(
                          ConstantVariables.tabBarHomeText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          size: ConstantIntegers.tabBarIcon,
                          color: Colors.white,
                        ),
                        Text(
                          ConstantVariables.tabBarHistoryText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: ConstantIntegers.tabBarIcon,
                          color: Colors.white,
                        ),
                        Text(
                          ConstantVariables.tabBarProfileText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHomeTab() {
    return Column(
      children: [
        Center(
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
                  color: Colors.black,
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
                      fontSize: ConstantIntegers.scanQRFontSize,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              ConstantVariables.recentChantsText,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: ConstantIntegers.recentSpace),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: ConstantIntegers.chatPaddingLeft,
              right: ConstantIntegers.chatPaddingRight,
            ),
            child: ListView(
              padding: EdgeInsets.all(ConstantIntegers.listViewPadding),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined),
                                SizedBox(
                                  width: ConstantIntegers.chatIconPadding,
                                ),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(
                                    fontSize: ConstantIntegers.homeVehicleFont,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
                                fontSize: ConstantIntegers.chatSize,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.whatsappVectorImage,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ConstantIntegers.chatBelowPadding),
                Divider(
                  thickness: ConstantIntegers.dividerThickness,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined),
                                SizedBox(
                                  width: ConstantIntegers.chatIconPadding,
                                ),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(
                                    fontSize: ConstantIntegers.homeVehicleFont,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
                                fontSize: ConstantIntegers.chatSize,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.whatsappVectorImage,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ConstantIntegers.chatBelowPadding),
                Divider(
                  thickness: ConstantIntegers.dividerThickness,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined),
                                SizedBox(
                                  width: ConstantIntegers.chatIconPadding,
                                ),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(
                                    fontSize: ConstantIntegers.homeVehicleFont,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
                                fontSize: ConstantIntegers.chatSize,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.whatsappVectorImage,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ConstantIntegers.chatBelowPadding),
                Divider(
                  thickness: ConstantIntegers.dividerThickness,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildHistoryTab() {
    return ListView(
      children: [
        SizedBox(height: ConstantIntegers.dateMarginBox),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: ConstantIntegers.dateMarginBoxLeft),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: ConstantVariables.dateHintText,
                  hintStyle: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: ConstantIntegers.dateMarginBoxMiddle),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: ConstantVariables.labelSelectTimeText,
                  labelStyle: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(Icons.timer_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: ConstantIntegers.dateMarginBoxRight),
          ],
        ),
        const SizedBox(height: ConstantIntegers.historyCardPadding),
        Card(
          margin: const EdgeInsets.all(ConstantIntegers.historyCardMargin),
          shadowColor: Colors.grey,
          color: Colors.white,
          elevation: ConstantIntegers.historyCardElevation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: ConstantIntegers.historyCardName,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        ConstantIntegers.starCountHistory,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: ConstantIntegers.starIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.historyVehicleFontSize,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: ConstantIntegers.linePadding),
                  Column(
                    children: [
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                      ),
                      Image.asset(
                        ConstantImages.assetImages + ConstantImages.line11Image,
                      ),
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(width: ConstantIntegers.linePaddingWidth),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantVariables.distanceArrivalText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConstantIntegers.arrivalDeparturePadding,
                        ),
                        Text(
                          ConstantVariables.distanceDepartureText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.departureBottomBox),
            ],
          ),
        ),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        Card(
          margin: const EdgeInsets.all(ConstantIntegers.historyCardMargin),
          shadowColor: Colors.grey,
          color: Colors.white,
          elevation: ConstantIntegers.historyCardElevation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: ConstantIntegers.historyCardName,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        ConstantIntegers.starCountHistory,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: ConstantIntegers.starIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.historyVehicleFontSize,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: ConstantIntegers.linePadding),
                  Column(
                    children: [
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                      ),
                      Image.asset(
                        ConstantImages.assetImages + ConstantImages.line11Image,
                      ),
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(width: ConstantIntegers.linePaddingWidth),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantVariables.distanceArrivalText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConstantIntegers.arrivalDeparturePadding,
                        ),
                        Text(
                          ConstantVariables.distanceDepartureText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.departureBottomBox),
            ],
          ),
        ),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        Card(
          margin: const EdgeInsets.all(ConstantIntegers.historyCardMargin),
          shadowColor: Colors.grey,
          color: Colors.white,
          elevation: ConstantIntegers.historyCardElevation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: Colors.white,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: ConstantIntegers.historyCardName,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        ConstantIntegers.starCountHistory,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: ConstantIntegers.starIconSize,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.historyVehicleFontSize,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: ConstantIntegers.linePadding),
                  Column(
                    children: [
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                      ),
                      Image.asset(
                        ConstantImages.assetImages + ConstantImages.line11Image,
                      ),
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(width: ConstantIntegers.linePaddingWidth),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantVariables.distanceArrivalText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConstantIntegers.arrivalDeparturePadding,
                        ),
                        Text(
                          ConstantVariables.distanceDepartureText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.departureBottomBox),
            ],
          ),
        ),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
      ],
    );
  }

  Widget buildProfileTab() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ConstantIntegers.profileUpperPadding),
            CircleAvatar(
              radius: ConstantIntegers.profileCircularAvatar,
              backgroundImage: AssetImage(
                ConstantImages.assetImages + ConstantImages.circularAvatarImage,
              ),
            ),
            const SizedBox(height: ConstantIntegers.profileNamePadding),
            Text(
              ConstantVariables.profileText,
              style: TextStyle(
                fontFamily: ConstantVariables.fontFamilyPoppins,
                fontSize: ConstantIntegers.profileNameFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: ConstantIntegers.profileNameStarPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                ConstantIntegers.profileStarCount,
                (index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: ConstantIntegers.profileStarSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: ConstantIntegers.profileInfoPaddingLeft,
                right: ConstantIntegers.profileInfoPaddingRight,
                top: ConstantIntegers.profileInfoPaddingTop,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ConstantVariables.employeeIdText,
                            style: TextStyle(
                              fontSize: ConstantIntegers.profileInfoTitle,
                              color: Colors.black,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.employeeIdNumberText,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ConstantIntegers.profileInfoSubTitle,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            ConstantVariables.contactNoText,
                            style: TextStyle(
                              fontSize: ConstantIntegers.profileInfoTitle,
                              color: Colors.black,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.mobileNoText,
                            style: TextStyle(
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              color: Colors.grey,
                              fontSize: ConstantIntegers.profileInfoSubTitle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: ConstantIntegers.profilePaddings),
                  Text(
                    ConstantVariables.jobTitleText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.profileInfoTitle,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.jobDescriptionText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: ConstantIntegers.profileInfoSubTitle,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: ConstantIntegers.profilePaddings),
                  Text(
                    ConstantVariables.supervisorText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.profileInfoTitle,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.supervisorNameText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: ConstantIntegers.profileInfoSubTitle,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: ConstantIntegers.infoFeedbackPadding),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                ConstantIntegers.feedbackContainerMargin,
              ),
              padding: const EdgeInsets.all(
                ConstantIntegers.feedbackContainerPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ConstantIntegers.feedbackContainerRadius,
                ),
                border: Border.all(
                  color: Colors.black,
                  width: ConstantIntegers.feedbackContainerBorder,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.feedbackText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.profileFeedbackFont,
                      color: Colors.grey,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: ConstantIntegers.feedbackInfoPadding),
                  Text(
                    ConstantVariables.feedbackContentText,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: ConstantIntegers.feedbackInfoFont,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
