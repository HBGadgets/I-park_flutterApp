import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants/constant_colors.dart';
import '../../../constants/constant_integers.dart';
import '../../../constants/constant_variables.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabScreen createState() => ProfileTabScreen();
}

class ProfileTabScreen extends State<ProfileTab> {
  File? profileImage;

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
      Navigator.pop(context);
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileTabViewContent(),
      backgroundColor: ConstantColors.defaultDashBoardColour,
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

  Widget profileTabViewContent() {
    return Center(child: profileScrollbar());
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
    return GestureDetector(
      onTap: () {
        if (profileImage != null) {
          showImagePreviewDialog(context);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: ConstantIntegers.profileCircularAvatar,
            backgroundColor: Colors.black,
            backgroundImage:
                profileImage != null ? FileImage(profileImage!) : null,
            child:
                profileImage == null
                    ? Icon(
                      Icons.person,
                      size: ConstantIntegers.circularAvatarImageSize,
                      color: Colors.white,
                    )
                    : null,
          ),
          Positioned(
            bottom: ConstantIntegers.positionImageBottom,
            right: ConstantIntegers.positionImageRight,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ConstantColors.profileEditIconBackground,
              ),
              child: IconButton(
                icon: Icon(
                  profileImage == null ? Icons.camera_alt : Icons.edit,
                  color: Colors.black,
                  size: ConstantIntegers.profileEditIconSize,
                ),
                onPressed: () {
                  if (profileImage == null) {
                    showImagePickerBottomSheet(context);
                  } else {
                    showEditOptionsBottomSheet(context);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePreviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child:
                  profileImage != null
                      ? Image.file(profileImage!, fit: BoxFit.contain)
                      : Center(
                        child: Text(
                          ConstantVariables.noImageSelectedText,
                          style: TextStyle(
                            fontFamily: ConstantVariables.fontFamilyPoppins,
                            color: Colors.white,
                            fontSize: ConstantIntegers.profileImageTextSize,
                          ),
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }

  void showEditOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ConstantIntegers.showBottomShitTopRadiusSize),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(ConstantIntegers.bottomShitPaddingSize),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ConstantVariables.profileOptionText,
                style: TextStyle(
                  fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                  fontSize: ConstantIntegers.profileOptionTextFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: ConstantIntegers.profileTextBelowSizedBoxHeight,
              ),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.black),
                title: Text(
                  ConstantVariables.changeProfileText,
                  style: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  showImagePickerBottomSheet(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.black),
                title: Text(
                  ConstantVariables.deleteProfileText,
                  style: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    profileImage = null;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ConstantIntegers.imagePickerBottomShitRadius),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(
            ConstantIntegers.imagePickerBottomShitPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ConstantVariables.addProfileText,
                style: TextStyle(
                  fontFamily: ConstantVariables.fontFamilyPoppinsBlack,
                  fontSize: ConstantIntegers.addProfileTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: ConstantIntegers.addProfileTextBelowSizedBoxHeight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconButtonOption(
                    Icons.photo_library,
                    ConstantVariables.galleryText,
                    () {
                      pickImage(context, ImageSource.gallery);
                    },
                  ),
                  iconButtonOption(
                    Icons.camera_alt,
                    ConstantVariables.cameraText,
                    () {
                      pickImage(context, ImageSource.camera);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget iconButtonOption(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: ConstantIntegers.iconButtonOptionSize,
            color: Colors.black,
          ),
          onPressed: onTap,
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: ConstantVariables.fontFamilyPoppins,
            fontWeight: FontWeight.bold,
            fontSize: ConstantIntegers.iconButtonLabelTextFontSize,
          ),
        ),
      ],
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
}
