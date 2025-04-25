import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hb/view/constants/constant_colors.dart';
import 'package:hb/view/ui/drawer/about_us.dart';
import 'package:hb/view/ui/drawer/feedback.dart';
import 'package:hb/view/ui/tabBar/historytab/history_tab.dart';
import 'package:hb/view/ui/login/login.dart';
import 'package:hb/view/ui/drawer/privacy_policy.dart';
import 'package:hb/view/ui/tabBar/profiletab/profile_tab.dart';
import 'package:hb/view/ui/valleyBoy/valleyBoyScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../controller/user_login_auth.dart';
import '../../../constants/constant_images.dart';
import '../../../constants/constant_integers.dart';
import '../../../constants/constant_variables.dart';
import '../chattab/chat_tab.dart';
import '../../drawer/help_support.dart';
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        bool shouldExit = await showExitConfirmationDialog(context);
        if (shouldExit) {
          Navigator.of(context).pop();
        }
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
                backgroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ), // Rounded edges
                contentPadding: EdgeInsets.zero,
                content: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Confirm Exit..!!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Are you sure ?",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          dialogueRoundedButton(
                            "Yes",
                            Colors.white,
                            () => Navigator.of(context).pop(true),
                          ),
                          const SizedBox(width: 10),
                          dialogueRoundedButton(
                            "No",
                            Colors.white,
                            () => Navigator.of(context).pop(false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ) ??
        false;

    if (shouldExit) {
      SystemNavigator.pop();
      return false;
    }

    return false;
  }

  Widget dialogueRoundedButton(
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ), // Rounded button
        ),
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
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
            onTap: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ValleyBoyScreen()),
    ),

          ),
          createDrawerItem(
            icon: Icons.logout,
            text: ConstantVariables.menuLogoutListText,
            onTap: () async {
              final BuildContext currentContext = context;
              final AuthService authService = AuthService();
              await authService.logout();
              final prefs = await SharedPreferences.getInstance();
              if (!prefs.containsKey('token')) {
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
