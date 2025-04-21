import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:intl/intl.dart';
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

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

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
      child: scaffold(),
    );
  }

  Widget scaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstantColors.defaultDashBoardColour,
      appBar: AppBar(
        backgroundColor: ConstantColors.appTabBarBackgroundColor,
        leading: appBarLeading(),
        title: appBarTitle(),
        centerTitle: true,
        actions: [appBarAction()],
      ),
      drawer: drawer(),
      body: contentColumn(),
    );
  }

  Widget appBarLeading() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.menu, color: ConstantColors.menuIconColor),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );
  }

  Widget appBarTitle() {
    return Text(
      appBarTitles[selectedTabIndex],
      style: TextStyle(
        color: ConstantColors.appBarTitlesColor,
        fontFamily: ConstantVariables.fontFamilyPoppins,
        fontSize: ConstantIntegers.selectedTabText,
      ),
    );
  }

  Widget appBarAction() {
    return Icon(
      Icons.notifications,
      color: ConstantColors.notificationIconColor,
    );
  }

  Widget contentColumn() {
    return Column(children: [tabBarContent(), tabBarContentContainer()]);
  }

  Widget tabBarContent() {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          homeTabViewContent(),
          historyTabViewContent(),
          profileTabViewContent(),
        ],
      ),
    );
  }

  Widget tabBarContentContainer() {
    return Container(
      height: ConstantIntegers.tabBarContainerHeight,
      color: Colors.black,
      child: tabBar(),
    );
  }

  Widget tabBar() {
    return TabBar(
      indicatorColor: ConstantColors.tabBarIndicatorColor,
      labelColor: ConstantColors.tabBarLabelColor,
      unselectedLabelColor: ConstantColors.unSelectedLabelColor,
      onTap: onTabChanged,
      tabs: [homeTab(), historyTab(), profileTab()],
    );
  }

  Widget homeTab() {
    return Tab(
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
    );
  }

  Widget historyTab() {
    return Tab(
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
    );
  }

  Widget profileTab() {
    return Tab(
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
    );
  }

  Widget drawer() {
    return Drawer(
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
          ), ListTile(
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
          ), ListTile(
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

        ],
      ),
    );
  }

  Widget homeTabViewContent() {
    return Column(
      children: [
        qrContent(),
        recentChatsContent(),
        chatsContent(),
        chatsContent(),
        chatsContent(),
      ],
    );
  }

  Widget qrContent() {
    return Center(
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
    );
  }

  Widget recentChatsContent() {
    return Row(
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
    );
  }

  Widget chatsContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: ConstantIntegers.chatPaddingLeft,
          right: ConstantIntegers.chatPaddingRight,
        ),
        child: ListView(
          padding: EdgeInsets.all(ConstantIntegers.listViewPadding),
          children: [
            chatColumn(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
            chatColumn(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
            chatColumn(),
            SizedBox(height: ConstantIntegers.chatBelowPadding),
            Divider(
              thickness: ConstantIntegers.dividerThickness,
              color: ConstantColors.homeScreenDividerColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget chatColumn() {
    return Column(
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
                    SizedBox(width: ConstantIntegers.chatIconPadding),
                    Text(
                      ConstantVariables.carNumberText,

                      style: TextStyle(
                        fontSize: ConstantIntegers.homeVehicleFont,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                        color: ConstantColors.homeScreenCarNoTextColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  ConstantVariables.carMessageText,
                  style: TextStyle(
                    fontSize: ConstantIntegers.chatSize,
                    color: ConstantColors.homeScreenCarMessageTextColor,
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset(
              ConstantImages.assetImages + ConstantImages.whatsappVectorImage,
            ),
          ],
        ),
      ],
    );
  }

  Widget historyTabViewContent() {
    return ListView(
      children: [
        SizedBox(height: ConstantIntegers.dateMarginBox),
        dateTimeRow(),
        const SizedBox(height: ConstantIntegers.historyCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
        historyCardContent(),
        SizedBox(height: ConstantIntegers.betweenCardPadding),
      ],
    );
  }

  Widget dateTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(width: ConstantIntegers.dateMarginBoxLeft),
        dateTimeTextField(
          ConstantVariables.dateHintText,
          Icons.calendar_month,
          () => _selectDate(context),
          dateController,
        ),
        const SizedBox(width: ConstantIntegers.dateMarginBoxMiddle),
        dateTimeTextField(
          ConstantVariables.labelSelectTimeText,
          Icons.timer_outlined,
          () => _selectTime(context),
          timeController,
        ),
        const SizedBox(width: ConstantIntegers.dateMarginBoxRight),
      ],
    );
  }

  Widget dateTimeTextField(
    String hintText,
    IconData icon,
    Function onTap,
    TextEditingController controller,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: ConstantColors.historyTextFieldHintTextColor,
                fontFamily: ConstantVariables.fontFamilyPoppins,
              ),
              prefixIcon: Icon(
                icon,
                color: ConstantColors.historyTextFieldIconColor,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text =
            "${picked.hour}:${picked.minute.toString().padLeft(2, '0')}"; // Format time
      });
    }
  }

  Widget historyCardContent() {
    return Card(
      margin: const EdgeInsets.all(ConstantIntegers.historyCardMargin),
      elevation: ConstantIntegers.historyCardElevation,
      shadowColor: ConstantColors.historyCardShadowColor,
      color: ConstantColors.historyCardColor,
      child: historyCardUserContentColumn(),
    );
  }

  Widget historyCardUserContentColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        listTileUser(),
        Divider(),
        arrivalDeparture(),
        SizedBox(height: ConstantIntegers.departureBottomBox),
      ],
    );
  }

  Widget listTileUser() {
    return ListTile(
      leading: listTileLeadingContentUser(),
      title: listTileTitleContentUser(),
      subtitle: listTileSubtitleContentUser(),
    );
  }

  Widget listTileLeadingContentUser() {
    return CircleAvatar(
      backgroundColor: ConstantColors.historyListAvatarBackgroundColor,
      child: Icon(
        Icons.person,
        size: ConstantIntegers.historyPersonIconSize,
        color: ConstantColors.historyPersonIconColor,
      ),
    );
  }

  Widget listTileTitleContentUser() {
    return Row(
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
    );
  }

  Widget listTileSubtitleContentUser() {
    return Text(
      ConstantVariables.historyCarNumberText,
      style: TextStyle(
        fontSize: ConstantIntegers.historyVehicleFontSize,
        fontFamily: ConstantVariables.fontFamilyPoppins,
        color: ConstantColors.historySubTitleTextColor,
      ),
    );
  }

  Widget arrivalDeparture() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: ConstantIntegers.linePadding),
        lineImageColumn(),
        SizedBox(width: ConstantIntegers.linePaddingWidth),
        Center(child: historyArrivalDepartureColumn()),
      ],
    );
  }

  Widget historyArrivalDepartureColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        arrivalDepartureText(ConstantVariables.distanceArrivalText),
        arrivalRow(),
        SizedBox(height: ConstantIntegers.arrivalDeparturePadding),
        arrivalDepartureText(ConstantVariables.distanceDepartureText),
        departureRow(),
      ],
    );
  }

  Widget arrivalDepartureText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: ConstantColors.historyArrivalTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget arrivalRow() {
    return Row(
      children: [
        calenderIcon(),
        dateText(),
        SizedBox(width: ConstantIntegers.dateTimePadding),
        timeIcon(),
        timeText(),
        SizedBox(width: ConstantIntegers.timePmPadding),
        pmText(),
      ],
    );
  }

  Widget calenderIcon() {
    return Icon(
      Icons.calendar_month,
      color: ConstantColors.historyCardCalenderIconColor,
    );
  }

  Widget dateText() {
    return Text(
      ConstantVariables.dateText,
      style: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins),
    );
  }

  Widget timeIcon() {
    return Icon(
      Icons.timer_outlined,
      color: ConstantColors.historyClockIconColor,
    );
  }

  Widget timeText() {
    return Text(
      ConstantVariables.timeText,
      style: TextStyle(
        color: ConstantColors.historyTimeTextColor,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget pmText() {
    return Text(
      ConstantVariables.hoursText,
      style: TextStyle(
        color: ConstantColors.historyHoursTextColor,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget departureRow() {
    return Row(
      children: [
        calenderIcon(),
        dateText(),
        SizedBox(width: ConstantIntegers.dateTimePadding),
        timeIcon(),
        timeText(),
        SizedBox(width: ConstantIntegers.timePmPadding),
        pmText(),
      ],
    );
  }

  Widget lineImageColumn() {
    return Column(children: [greyDotImage(), lineImage(), blackDotImage()]);
  }

  Widget greyDotImage() {
    return Image.asset(
      ConstantImages.assetImages + ConstantImages.ellipseLineImage,
    );
  }

  Widget lineImage() {
    return Image.asset(ConstantImages.assetImages + ConstantImages.line11Image);
  }

  Widget blackDotImage() {
    return Image.asset(
      ConstantImages.assetImages + ConstantImages.ellipseLineImage,
      color: ConstantColors.historyArrivalLineColor,
    );
  }

  Widget profileTabViewContent() {
    return Center(child: profileScrollbar());
  }
}

Widget profileScrollbar() {
  return SingleChildScrollView(child: profileColumn());
}

Widget profileColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: ConstantIntegers.profileUpperPadding),
      profileCircularAvatar(),
      const SizedBox(height: ConstantIntegers.profileNamePadding),
      profileText(),
      const SizedBox(height: ConstantIntegers.profileNameStarPadding),
      starRow(),
      profilePadding(),
      profileContainer(),
    ],
  );
}

Widget starRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      ConstantIntegers.profileStarCount,
      (index) => Icon(
        Icons.star,
        color: ConstantColors.profileStarsColor,
        size: ConstantIntegers.profileStarSize,
      ),
    ),
  );
}

Widget profilePadding() {
  return Padding(
    padding: const EdgeInsets.only(
      left: ConstantIntegers.profileInfoPaddingLeft,
      right: ConstantIntegers.profileInfoPaddingRight,
      top: ConstantIntegers.profileInfoPaddingTop,
    ),
    child: profilePaddingColumn(),
  );
}

Widget profilePaddingColumn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      profileColumnRow(),
      const SizedBox(height: ConstantIntegers.profilePaddings),
      userInfoTitle(ConstantVariables.jobTitleText),
      userInfoSubtitle(ConstantVariables.jobDescriptionText),
      const SizedBox(height: ConstantIntegers.profilePaddings),
      userInfoTitle(ConstantVariables.supervisorText),
      userInfoSubtitle(ConstantVariables.supervisorNameText),
      const SizedBox(height: ConstantIntegers.infoFeedbackPadding),
    ],
  );
}

Widget profileColumnRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userInfoTitle(ConstantVariables.employeeIdText),
          userInfoSubtitle(ConstantVariables.employeeIdNumberText),
        ],
      ),
      Column(
        children: [
          userInfoTitle(ConstantVariables.contactNoText),
          userInfoSubtitle(ConstantVariables.mobileNoText),
        ],
      ),
    ],
  );
}

Widget userInfoTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      color: ConstantColors.allProfileTextColor,
      fontSize: ConstantIntegers.profileInfoTitle,
      fontFamily: ConstantVariables.fontFamilyPoppins,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget userInfoSubtitle(String text) {
  return Text(
    text,
    style: TextStyle(
      color: ConstantColors.allProfileSubTextColor,
      fontSize: ConstantIntegers.profileInfoSubTitle,
      fontFamily: ConstantVariables.fontFamilyPoppins,
    ),
  );
}

Widget profileContainer() {
  return Container(
    margin: const EdgeInsets.all(ConstantIntegers.feedbackContainerMargin),
    padding: const EdgeInsets.all(ConstantIntegers.feedbackContainerPadding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        ConstantIntegers.feedbackContainerRadius,
      ),
      border: Border.all(
        color: ConstantColors.feedbackContainerBorderColor,
        width: ConstantIntegers.feedbackContainerBorder,
      ),
    ),
    child: containerColumn(),
  );
}

Widget containerColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      feedbackText(),
      const SizedBox(height: ConstantIntegers.feedbackInfoPadding),
      feedbackTextContentText(),
    ],
  );
}

Widget feedbackText() {
  return Text(
    ConstantVariables.feedbackText,
    style: TextStyle(
      fontSize: ConstantIntegers.profileFeedbackFont,
      color: ConstantColors.feedbackColorText,
      fontFamily: ConstantVariables.fontFamilyPoppins,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget feedbackTextContentText() {
  return Text(
    ConstantVariables.feedbackContentText,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: ConstantIntegers.feedbackInfoFont,
      fontFamily: ConstantVariables.fontFamilyPoppins,
      color: ConstantColors.feedbackContentColorText,
    ),
  );
}

Widget profileCircularAvatar() {
  return CircleAvatar(
    radius: ConstantIntegers.profileCircularAvatar,
    backgroundImage: AssetImage(
      ConstantImages.assetImages + ConstantImages.circularAvatarImage,
    ),
  );
}

Widget profileText() {
  return Text(
    ConstantVariables.profileText,
    style: TextStyle(
      color: ConstantColors.profileNameText,
      fontFamily: ConstantVariables.fontFamilyPoppins,
      fontSize: ConstantIntegers.profileNameFont,
      fontWeight: FontWeight.bold,
    ),
  );
}
