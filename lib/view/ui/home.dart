import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/ui/about_us.dart';
import 'package:hb/view/ui/feedback.dart';
import 'package:hb/view/ui/history_tab.dart';
import 'package:hb/view/ui/login.dart';
import 'package:hb/view/ui/privacy_policy.dart';
import 'package:hb/view/ui/profile_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/user_login_api.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';
import 'chat_tab.dart';
import 'help_support.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  final bool isLoading;

  const HomePage({super.key, this.isLoading = false});

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
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await showExitConfirmationDialog(context);
        return shouldExit;
      },
      child: DefaultTabController(
        length: ConstantIntegers.tabBarLength,
        initialIndex: selectedTabIndex,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ConstantColors.defaultDashBoardColour,
          appBar: AppBar(
            backgroundColor: ConstantColors.appTabBarBackgroundColor,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: ConstantColors.menuIconColor,
                    size: ConstantIntegers.menuSize,
                  ),
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
                size: ConstantIntegers.notificationSize,
              ),
            ],
          ),
          drawer: buildDrawer(),
          body:
              widget.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Scrollbar(
                    thumbVisibility: true,
                    thickness: ConstantIntegers.scrollThickness,
                    radius: Radius.circular(ConstantIntegers.scrollRadius),
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              HomeTab(),
                              ChatTab(),
                              HistoryTab(),
                              ProfileTab(),
                            ],
                          ),
                        ),
                        Container(
                          height: ConstantIntegers.tabBarContainerHeight,
                          color: ConstantColors.tabBarContainer,
                          child: TabBar(
                            onTap: onTabChanged,
                            indicatorColor: ConstantColors.tabBarIndicatorColor,
                            labelColor: ConstantColors.tabBarLabelColor,
                            dividerColor: Colors.black,
                            unselectedLabelColor:
                                ConstantColors.unSelectedLabelColor,
                            tabs: [
                              homeTab(),
                              chatTab(),
                              historyTab(),
                              profileTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    final shouldExit =
        await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text("Confirm Exit..!!"),
                content: Text("Are you sure you want to exit the app?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text("No"),
                  ),
                ],
              ),
        ) ??
        false;

    if (shouldExit) {
      SystemNavigator.pop();
      return false;
    }

    return false;
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
            ConstantImages.assetImages + ConstantImages.whatsappVectorImage,
            color: ConstantColors.tabBarWhatsApp,
            height: ConstantIntegers.whatsappImageHeight,
            width: ConstantIntegers.whatsappImageWidth,
          ),
          const SizedBox(height: ConstantIntegers.whatsappImageTabSpace),
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

  Widget buildDrawer() {
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
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                ),
          ),
          createDrawerItem(
            icon: Icons.star_border,
            text: ConstantVariables.menuRatingListText,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                ),
          ),
          createDrawerItem(
            icon: Icons.support_agent_outlined,
            text: ConstantVariables.menuHelpSupportListText,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpSupport()),
                ),
          ),
          createDrawerItem(
            icon: Icons.privacy_tip_outlined,
            text: ConstantVariables.menuPrivacyListText,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ),
                ),
          ),
          createDrawerItem(
            icon: Icons.settings_outlined,
            text: ConstantVariables.menuSettingsListText,
            onTap: () => Navigator.pop(context),
          ),
          createDrawerItem(
            icon: Icons.logout,
            text: ConstantVariables.menuLogoutListText,
            onTap: () async {
              final BuildContext currentContext = context;
              final prefs = await SharedPreferences.getInstance();
              if (prefs.containsKey('token')) {
                await Provider.of<UserProvider>(
                  currentContext,
                  listen: false,
                ).logout();
                if (currentContext.mounted) {
                  Navigator.pushReplacement(
                    currentContext,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              }
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
      leading: Icon(
        icon,
        color: ConstantColors.drawerMenuListIconColor,
        size: ConstantIntegers.drawerIconSize,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: ConstantColors.drawerMenuListTextColor,
          fontWeight: FontWeight.bold,
          fontFamily: ConstantVariables.fontFamilyPoppins,
          fontSize: ConstantIntegers.drawerTextSize,
        ),
      ),
      onTap: onTap,
    );
  }
}
