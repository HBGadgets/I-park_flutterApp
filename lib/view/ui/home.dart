import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/constants/constants_variables.dart';

import '../constants/constant_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  int selectedTabIndex = 0;
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
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ConstantColors.appTabBarBackgroundColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: ConstantColors.menuIconColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text(
            appBarTitles[selectedTabIndex],
            style: TextStyle(
              color: ConstantColors.appBarTitlesColor,
              fontFamily: ConstantVariables.fontFamilyPoppins,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          actions: [Icon(Icons.notifications, color: ConstantColors.notificationIconColor)],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: ConstantColors.appTabBarBackgroundColor),
                child: Text(
                  ConstantVariables.menuDrawerHeaderText,
                  style: TextStyle(
                    color: ConstantColors.drawerMenuTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info,color: ConstantColors.drawerMenuListIconColor,),
                title: Text(
                  ConstantVariables.menuAboutUsListText,
                  style: TextStyle(color: ConstantColors.drawerMenuListTextColor,fontWeight: FontWeight.bold,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,color: ConstantColors.drawerMenuListIconColor),
                title: Text(
                  ConstantVariables.menuSettingsListText,
                  style: TextStyle(color: ConstantColors.drawerMenuListTextColor,fontWeight: FontWeight.bold,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,color: ConstantColors.drawerMenuListIconColor),
                title: Text(
                  ConstantVariables.menuLogoutListText,
                  style: TextStyle(color: ConstantColors.drawerMenuListTextColor,fontWeight: FontWeight.bold,
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
              height: 70,
              color: ConstantColors.appTabBarBackgroundColor,
              child: TabBar(
                indicatorColor: ConstantColors.tabBarIndicatorColor,
                labelColor: ConstantColors.tabBarLabelColor,
                unselectedLabelColor: ConstantColors.unSelectedLabelColor,
                onTap: onTabChanged,
                tabs: const [
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 30, color: ConstantColors.tabBarIconsColor),
                        Text(
                          ConstantVariables.tabBarHomeText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: ConstantColors.tabBarIconsTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history, size: 30, color:ConstantColors.tabBarIconsColor),
                        Text(
                          ConstantVariables.tabBarHistoryText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: ConstantColors.tabBarIconsTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 30, color: ConstantColors.tabBarIconsColor),
                        Text(
                          ConstantVariables.tabBarProfileText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: ConstantColors.tabBarIconsTextColor,
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
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 382,
              width: 345,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: ConstantColors.homeTabBorderColor, width: 1),
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
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        ConstantVariables.homePersonNameText,
                        style: TextStyle(color: ConstantColors.homeScreenPersonNameTextColor,
                          fontSize: 18,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    ConstantImages.assetImages + ConstantImages.qrImage,
                    width: 259,
                    height: 259,
                  ),
                  const Text(
                    ConstantVariables.scanQRText,
                    style: TextStyle(color: ConstantColors.scanQrTextColor,
                      fontSize: 24,
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
                color: ConstantColors.recentChatsTextColor,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined,color: ConstantColors.homeScreenCarIconColor),
                                SizedBox(width: 10),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(color: ConstantColors.homeScreenCarNoTextColor,
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(color: ConstantColors.homeScreenCarMessageTextColor,
                                fontSize: 16,
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
                SizedBox(height: 8),
                Divider(height: 15, thickness: 1, color: ConstantColors.homeScreenDividerColor),
                Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined),
                                SizedBox(width: 10),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(color: ConstantColors.homeScreenCarNoTextColor,
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(color: ConstantColors.homeScreenCarMessageTextColor,
                                fontSize: 16,
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
                SizedBox(height: 8),
                Divider(height: 15, thickness: 1, color: ConstantColors.homeScreenDividerColor),
                Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_outlined),
                                SizedBox(width: 10),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(color: ConstantColors.homeScreenCarNoTextColor,
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(color: ConstantColors.homeScreenCarMessageTextColor,
                                fontSize: 16,
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
                SizedBox(height: 8),
                Divider(height: 15, thickness: 1, color: ConstantColors.homeScreenDividerColor),
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
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: ConstantVariables.dateHintText,
                  hintStyle: TextStyle(color: ConstantColors.historyTextFieldHintTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(Icons.calendar_month,color: ConstantColors.historyTextFieldIconColor,),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: ConstantVariables.labelSelectTimeText,
                  labelStyle: TextStyle(color: ConstantColors.historyTextFieldHintTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(Icons.timer_outlined,color:ConstantColors.historyTextFieldIconColor,),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 20),
        Card(
          margin: const EdgeInsets.all(10),
          shadowColor: ConstantColors.historyCardShadowColor,
          color: ConstantColors.historyCardColor,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: ConstantColors.historyListAvatarBackgroundColor,
                  child: Icon(Icons.person, size: 38, color: ConstantColors.historyPersonIconColor),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(color: ConstantColors.historyPersonNameTextColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) =>
                            Icon(Icons.star, color: ConstantColors.profileStarsColor, size: 12),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(color: ConstantColors.historySubTitleTextColor,
                    fontSize: 13,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
                  Column(
                    children: [
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                      ),
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.line11Image,
                      ),
                      Image.asset(
                        ConstantImages.assetImages +
                            ConstantImages.ellipseLineImage,
                        color: ConstantColors.historyArrivalLineColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 35),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantVariables.distanceArrivalText,
                          style: TextStyle(color: ConstantColors.historyArrivalTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month,color: ConstantColors.historyCardCalenderIconColor),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined,color: ConstantColors.historyClockIconColor),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(color: ConstantColors.historyTimeTextColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(color: ConstantColors.historyHoursTextColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          ConstantVariables.distanceDepartureText,
                          style: TextStyle(color: ConstantColors.historyDepartureTextColor,
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
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
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
              SizedBox(height: 30),
            ],
          ),
        ),
        SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.all(10),
          shadowColor: Colors.grey,
          color: Colors.white,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, size: 38, color: Colors.white),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) =>
                            Icon(Icons.star, color: Colors.amber, size: 12),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
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
                  SizedBox(width: 35),
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
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
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
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
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
              SizedBox(height: 30),
            ],
          ),
        ),
        SizedBox(height: 10),
        Card(
          margin: const EdgeInsets.all(10),
          shadowColor: Colors.grey,
          color: Colors.white,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, size: 38, color: Colors.white),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) =>
                            Icon(Icons.star, color: Colors.amber, size: 12),
                      ),
                    ),
                  ],
                ),
                subtitle: const Text(
                  ConstantVariables.historyCarNumberText,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
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
                  SizedBox(width: 35),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConstantVariables.distanceArrivalText,
                          style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold),
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
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          ConstantVariables.distanceDepartureText,
                          style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold),
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
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
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
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProfileTab() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 90,
              backgroundImage: AssetImage(
                ConstantImages.assetImages + ConstantImages.circularAvatarImage,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              ConstantVariables.profileText,
              style: TextStyle(color: ConstantColors.profileNameText,
                fontFamily: ConstantVariables.fontFamilyPoppins,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: ConstantColors.profileStarsColor, size: 15),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            ConstantVariables.employeeIdText,
                            style: TextStyle(
                              fontSize: 16,
                              color: ConstantColors.allProfileTextColor,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.employeeIdNumberText,
                            style: TextStyle(
                              color: ConstantColors.allProfileSubTextColor,
                              fontSize: 16,
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
                              fontSize: 16,
                              color: ConstantColors.allProfileTextColor,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.mobileNoText,
                            style: TextStyle(
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              color: ConstantColors.allProfileSubTextColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ConstantVariables.jobTitleText,
                    style: TextStyle(
                      fontSize: 16,
                      color: ConstantColors.allProfileTextColor,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.jobDescriptionText,
                    style: TextStyle(
                      color: ConstantColors.allProfileSubTextColor,
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ConstantVariables.supervisorText,
                    style: TextStyle(
                      fontSize: 16,
                      color: ConstantColors.allProfileTextColor,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.supervisorNameText,
                    style: TextStyle(
                      color: ConstantColors.allProfileSubTextColor,
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: ConstantColors.feedbackContainerBorderColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.feedbackText,
                    style: TextStyle(
                      fontSize: 16,
                      color: ConstantColors.feedbackColorText,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ConstantVariables.feedbackContentText,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      color: ConstantColors.feedbackContentColorText,
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
