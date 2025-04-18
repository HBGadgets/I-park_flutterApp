import 'package:flutter/material.dart';
import 'package:hb/view/constants/constants_images.dart';
import 'package:hb/view/constants/constants_variables.dart';

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
                  const Text(
                    'Scan QR',
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
              "Recent Chats",
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
                                  "MH36A6678",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "I Need my car in 30 min..",
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
                                  "MH36A6678",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "I Need my car in 30 min..",
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
                                  "MH36A6678",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "I Need my car in 30 min..",
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
                  hintText: 'DD/MM/YY',
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
                  labelText: 'Select Time',
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
                      'Shrikant Ramesh Yadav',
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
                  'MH36A6678',
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
                          "Arrival",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19:09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Departure",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19:09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
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
                      'Shrikant Ramesh Yadav',
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
                  'MH36A6678',
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
                          "Arrival",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19:09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Departure",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19:09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
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
                      'Shrikant Ramesh Yadav',
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
                  'MH36A6678',
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
                          "Arrival",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19 :09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Departure",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(
                              "17.02-2025",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 50),
                            Icon(Icons.timer_outlined),
                            Text(
                              "19:09",
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "PM",
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
              'Rohan Rah',
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
                            'Employee ID',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'EMP0001111',
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
                            'Contact no',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '+91 75484856',
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
                    'Job Title',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Valley Parking Attendant',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Supervisor',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Deepak Rahate',
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
                    'Feedback:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '"I recently had the pleasure of experiencing Valley Boy, and I have to say, it was an absolute delight! The music is fresh, catchy, and the lyrics are both thoughtful and relatable. Valley Boy has a unique sound that combines laid-back vibes with an edgy twist, creating a perfect balance for a variety of moods."',
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
