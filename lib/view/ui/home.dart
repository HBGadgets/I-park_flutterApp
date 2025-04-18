import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';

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
              fontSize: ConstantIntegers.selectedTabText,
            ),
          ),
          centerTitle: true,
          actions: [
            Icon(
              Icons.notifications,
              color: ConstantColors.notificationIconColor,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: ConstantColors.appTabBarBackgroundColor,
                ),
                child: Text(
                  ConstantVariables.menuDrawerHeaderText,
                  style: TextStyle(
                    color: ConstantColors.drawerMenuTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                    fontSize: ConstantIntegers.menuText,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: ConstantColors.drawerMenuListIconColor,
                ),
                title: Text(
                  ConstantVariables.menuAboutUsListText,
                  style: TextStyle(
                    color: ConstantColors.drawerMenuListTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: ConstantColors.drawerMenuListIconColor,
                ),
                title: Text(
                  ConstantVariables.menuSettingsListText,
                  style: TextStyle(
                    color: ConstantColors.drawerMenuListTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: ConstantColors.drawerMenuListIconColor,
                ),
                title: Text(
                  ConstantVariables.menuLogoutListText,
                  style: TextStyle(
                    color: ConstantColors.drawerMenuListTextColor,
                    fontWeight: FontWeight.bold,
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
                indicatorColor: ConstantColors.tabBarIndicatorColor,
                labelColor: ConstantColors.tabBarLabelColor,
                unselectedLabelColor: ConstantColors.unSelectedLabelColor,
                onTap: onTabChanged,
                tabs: const [
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: ConstantIntegers.tabBarIcon,
                          color: ConstantColors.tabBarIconsColor,
                        ),

                        Text(
                          ConstantVariables.tabBarHomeText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
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
                        Icon(
                          Icons.history,
                          size: ConstantIntegers.tabBarIcon,
                          color: ConstantColors.tabBarIconsColor,
                        ),

                        Text(
                          ConstantVariables.tabBarHistoryText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
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
                        Icon(
                          Icons.person,
                          size: ConstantIntegers.tabBarIcon,
                          color: ConstantColors.tabBarIconsColor,
                        ),

                        Text(
                          ConstantVariables.tabBarProfileText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            fontSize: ConstantIntegers.tabBarText,
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
                                Icon(
                                  Icons.directions_car_outlined,
                                  color: ConstantColors.homeScreenCarIconColor,
                                ),
                                SizedBox(
                                  width: ConstantIntegers.chatIconPadding,
                                ),
                                Text(
                                  ConstantVariables.carNumberText,

                                  style: TextStyle(
                                    fontSize: ConstantIntegers.homeVehicleFont,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                    color:
                                        ConstantColors.homeScreenCarNoTextColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
                                fontSize: ConstantIntegers.chatSize,
                                color:
                                    ConstantColors
                                        .homeScreenCarMessageTextColor,
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
                  color: ConstantColors.homeScreenDividerColor,
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
                                    color:
                                        ConstantColors.homeScreenCarNoTextColor,
                                    fontFamily:
                                        ConstantVariables.fontFamilyPoppins,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              ConstantVariables.carMessageText,
                              style: TextStyle(
                                color:
                                    ConstantColors
                                        .homeScreenCarMessageTextColor,
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
                  color: ConstantColors.homeScreenDividerColor,
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
                                    color:
                                        ConstantColors.homeScreenCarNoTextColor,
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
                                color:
                                    ConstantColors
                                        .homeScreenCarMessageTextColor,
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
                  color: ConstantColors.homeScreenDividerColor,
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
                    color: ConstantColors.historyTextFieldHintTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(
                    Icons.calendar_month,
                    color: ConstantColors.historyTextFieldIconColor,
                  ),
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
                    color: ConstantColors.historyTextFieldHintTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                  prefixIcon: Icon(
                    Icons.timer_outlined,
                    color: ConstantColors.historyTextFieldIconColor,
                  ),
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
          elevation: ConstantIntegers.historyCardElevation,
          shadowColor: ConstantColors.historyCardShadowColor,
          color: ConstantColors.historyCardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor:
                      ConstantColors.historyListAvatarBackgroundColor,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: ConstantColors.historyPersonIconColor,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        color: ConstantColors.historyPersonNameTextColor,
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
                          color: ConstantColors.profileStarsColor,
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
                    color: ConstantColors.historySubTitleTextColor,
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
                        color: ConstantColors.historyArrivalLineColor,
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
                            color: ConstantColors.historyArrivalTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color:
                                  ConstantColors.historyCardCalenderIconColor,
                            ),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(
                              Icons.timer_outlined,
                              color: ConstantColors.historyClockIconColor,
                            ),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                color: ConstantColors.historyTimeTextColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                color: ConstantColors.historyHoursTextColor,
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
                            color: ConstantColors.historyDepartureTextColor,
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
          elevation: ConstantIntegers.historyCardElevation,
          shadowColor: ConstantColors.historyCardShadowColor,
          color: ConstantColors.historyCardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor:
                      ConstantColors.historyListAvatarBackgroundColor,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: ConstantColors.historyPersonIconColor,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        color: ConstantColors.historyPersonNameTextColor,
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
                          color: ConstantColors.profileStarsColor,
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
                    color: ConstantColors.historySubTitleTextColor,
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
                        color: ConstantColors.historyArrivalLineColor,
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
                            color: ConstantColors.historyArrivalTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color:
                                  ConstantColors.historyCardCalenderIconColor,
                            ),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(
                              Icons.timer_outlined,
                              color: ConstantColors.historyClockIconColor,
                            ),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                color: ConstantColors.historyTimeTextColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                color: ConstantColors.historyHoursTextColor,
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
                            color: ConstantColors.historyDepartureTextColor,
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
          elevation: ConstantIntegers.historyCardElevation,
          shadowColor: ConstantColors.historyCardShadowColor,
          color: ConstantColors.historyCardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor:
                      ConstantColors.historyListAvatarBackgroundColor,
                  child: Icon(
                    Icons.person,
                    size: ConstantIntegers.historyPersonIconSize,
                    color: ConstantColors.historyPersonIconColor,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ConstantVariables.historyPersonNameText,
                      style: TextStyle(
                        color: ConstantColors.historyPersonNameTextColor,
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
                          color: ConstantColors.profileStarsColor,
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
                    color: ConstantColors.historySubTitleTextColor,
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
                        color: ConstantColors.historyArrivalLineColor,
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
                            color: ConstantColors.historyArrivalTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color:
                                  ConstantColors.historyCardCalenderIconColor,
                            ),
                            Text(
                              ConstantVariables.dateText,
                              style: TextStyle(
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.dateTimePadding),
                            Icon(
                              Icons.timer_outlined,
                              color: ConstantColors.historyClockIconColor,
                            ),
                            Text(
                              ConstantVariables.timeText,
                              style: TextStyle(
                                color: ConstantColors.historyTimeTextColor,
                                fontFamily: ConstantVariables.fontFamilyPoppins,
                              ),
                            ),
                            SizedBox(width: ConstantIntegers.timePmPadding),
                            Text(
                              ConstantVariables.hoursText,
                              style: TextStyle(
                                color: ConstantColors.historyHoursTextColor,
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
                            color: ConstantColors.historyDepartureTextColor,
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
                color: ConstantColors.profileNameText,
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
                  color: ConstantColors.profileStarsColor,
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
                              color: ConstantColors.allProfileTextColor,
                              fontSize: ConstantIntegers.profileInfoTitle,
                              fontFamily: ConstantVariables.fontFamilyPoppins,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ConstantVariables.employeeIdNumberText,
                            style: TextStyle(
                              color: ConstantColors.allProfileSubTextColor,
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
                      color: ConstantColors.allProfileTextColor,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.jobDescriptionText,
                    style: TextStyle(
                      color: ConstantColors.allProfileSubTextColor,
                      fontSize: ConstantIntegers.profileInfoSubTitle,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  const SizedBox(height: ConstantIntegers.profilePaddings),
                  Text(
                    ConstantVariables.supervisorText,
                    style: TextStyle(
                      color: ConstantColors.allProfileTextColor,
                      fontSize: ConstantIntegers.profileInfoTitle,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstantVariables.supervisorNameText,
                    style: TextStyle(
                      fontSize: ConstantIntegers.profileInfoSubTitle,
                      color: ConstantColors.allProfileSubTextColor,
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
                  color: ConstantColors.feedbackContainerBorderColor,
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
                      color: ConstantColors.feedbackColorText,
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
