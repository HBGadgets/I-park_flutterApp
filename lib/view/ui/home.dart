import 'package:flutter/material.dart';
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
              fontSize: 24,
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
                    fontSize: 24,
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
              height: 70,
              color: Colors.black,
              child: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withAlpha(153),
                onTap: onTabChanged,
                tabs: const [
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 30, color: Colors.white),
                        Text(
                          ConstantVariables.tabBarHomeText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
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
                        Icon(Icons.history, size: 30, color: Colors.white),
                        Text(
                          ConstantVariables.tabBarHistoryText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
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
                        Icon(Icons.person, size: 30, color: Colors.white),
                        Text(
                          ConstantVariables.tabBarProfileText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: 11,
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
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 382,
              width: 345,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.black, width: 1),
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
                        style: TextStyle(
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
                  const Text(ConstantVariables.scanQRText,
                    style: TextStyle(
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
                color: Colors.grey,
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
                                Icon(Icons.directions_car_outlined),
                                SizedBox(width: 10),
                                Text(
                                  ConstantVariables.carNumberText,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
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
                Divider(height: 15, thickness: 1, color: Colors.black),
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
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
                Divider(height: 15, thickness: 1, color: Colors.black),
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
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
                Divider(height: 15, thickness: 1, color: Colors.black),
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
                  hintStyle: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
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
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 20),
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
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.ellipseLineImage
                        ),
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.line11Image
                        ),
                        Image.asset(
                          ConstantImages.assetImages +
                              ConstantImages.ellipseLineImage,
                          color: Colors.black,
                        ),
                      ],
                    ),
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
                      Image.asset(ConstantImages.assetImages +
                          ConstantImages.ellipseLineImage),
                      Image.asset(ConstantImages.assetImages +
                          ConstantImages.line11Image),
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
                      Image.asset(ConstantImages.assetImages +
                          ConstantImages.ellipseLineImage),
                      Image.asset(ConstantImages.assetImages +
                          ConstantImages.line11Image),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
              style: TextStyle(
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
                (index) => Icon(Icons.star, color: Colors.amber, size: 15),
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
                              color: Colors.black,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.employeeIdNumberText,
                            style: TextStyle(
                              color: Colors.grey,
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
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.jobDescriptionText,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    ConstantVariables.supervisorText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.supervisorNameText,
                    style: TextStyle(
                      color: Colors.grey,
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
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.feedbackText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
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
