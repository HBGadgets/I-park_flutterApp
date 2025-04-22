import 'package:flutter/material.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/ui/about_us.dart';
import 'package:hb/view/ui/feedback.dart';
import 'package:hb/view/ui/history_tab.dart';
import 'package:hb/view/ui/login.dart';
import 'package:hb/view/ui/privacy_policy.dart';
import 'package:hb/view/ui/profile_tab.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';
import 'chat_tab.dart';
import 'help_support.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  int selectedTabIndex = ConstantIntegers.selectedTab;

  final List<String> appBarTitles = [
    ConstantVariables.homeListAppBarTitle,
    ConstantVariables.chatListAppBarTitle,
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
      size: 31,
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
          HomeTab(),
          ChatTab(),
          HistoryTabScreen().historyTabViewContent(),
          ProfileTabScreen().profileTabViewContent(),
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
      tabs: [
        homeTab(),
        chatTab(),
        HistoryTabScreen().historyTab(),
        ProfileTabScreen().profileTab(),
      ],
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

  Widget chatTab() {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Vector.png",
            color: Colors.white,
            height: 25,
            width: 25,
          ),
          SizedBox(height: 5),
          Text(
            ConstantVariables.tabBarChatText,
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
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstantColors.drawerHeaderBackgroundColor,
            ),
            child: Image.asset(
              ConstantImages.assetImages + ConstantImages.iParkLogo,
              height: ConstantIntegers.irixHeight,
              width: ConstantIntegers.irixWidth,
              color: ConstantColors.loginLogoColor,
            ),
          ),
          createDrawerItem(
            icon: Icons.insert_drive_file_outlined,
            text: ConstantVariables.menuAboutUsListText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsScreen()),
              );
            },
          ),
          createDrawerItem(
            icon: Icons.star_border,
            text: ConstantVariables.menuRatingListText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
          createDrawerItem(
            icon: Icons.support_agent_outlined,
            text: ConstantVariables.menuHelpSupportListText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpSupport()),
              );
            },
          ),
          createDrawerItem(
            icon: Icons.privacy_tip_outlined,
            text: ConstantVariables.menuPrivacyListText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              );
            },
          ),
          createDrawerItem(
            icon: Icons.settings_outlined,
            text: ConstantVariables.menuSettingsListText,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          createDrawerItem(
            icon: Icons.logout,
            text: ConstantVariables.menuLogoutListText,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: ConstantColors.drawerMenuListIconColor),
      title: Text(
        text,
        style: TextStyle(
          color: ConstantColors.drawerMenuListTextColor,
          fontWeight: FontWeight.bold,
          fontFamily: ConstantVariables.fontFamilyPoppins,
        ),
      ),
      onTap: onTap,
    );
  }
}
