import 'package:flutter/material.dart';
import '../constants/constants_colors.dart';
import '../constants/constants_images.dart';
import '../constants/constants_integers.dart';
import '../constants/constants_variables.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageScreen createState() => LoginPageScreen();
}

class LoginPageScreen extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: ConstantIntegers.loginMarginLeft,
          right: ConstantIntegers.loginMarginRight,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: ConstantIntegers.loginUpperSpaceHeight),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      ConstantsImages.assetImages + ConstantsImages.iParkLogo,
                      height: ConstantIntegers.irixHeight,
                      width: ConstantIntegers.irixWidth,
                      color: ConstantColors.primaryColor,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: ConstantIntegers.loginPaddingTop,
                        left: ConstantIntegers.loginPaddingLeft,
                        right: ConstantIntegers.loginPaddingRight,
                      ),
                      child: Text(
                        ConstantVariables.login,
                        style: TextStyle(
                          fontSize: ConstantIntegers.loginFontSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.noAccountSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.noAccount,
                    style: TextStyle(
                      fontSize: ConstantIntegers.noAccountSize,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ConstantVariables.youCan,
                    style: TextStyle(
                      fontSize: ConstantIntegers.noAccountSize,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      ConstantVariables.registerHere,
                      style: TextStyle(
                        fontSize: ConstantIntegers.noAccountSize,
                        fontWeight: FontWeight.bold,
                        color: ConstantColors.registerColor,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.spaceEmail),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.email,
                    style: TextStyle(
                      fontSize: ConstantIntegers.labelText,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    color: ConstantColors.iconColor,
                  ),
                  hintText: ConstantVariables.enterEmail,
                  hintStyle: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                style: TextStyle(
                  color: ConstantColors.textFieldText,
                  fontSize: ConstantIntegers.textFieldFontSize,
                ),
              ),
              SizedBox(height: ConstantIntegers.passwordSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ConstantVariables.password,
                    style: TextStyle(
                      fontSize: ConstantIntegers.labelText,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: ConstantColors.iconColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: ConstantColors.iconColor,
                  ),
                  hintText: ConstantVariables.enterPassword,
                  hintStyle: TextStyle(
                    fontFamily: ConstantVariables.fontFamilyPoppins,
                  ),
                ),
                style: TextStyle(
                  color: ConstantColors.textFieldText,
                  fontSize: ConstantIntegers.textFieldFontSize,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      Text(
                        ConstantVariables.rememberMe,
                        style: TextStyle(
                          color: ConstantColors.rememberColor,
                          fontSize: ConstantIntegers.rememberMeFont,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantVariables.fontFamilyPoppins,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      ConstantVariables.forgetPassword,
                      style: TextStyle(
                        color: ConstantColors.forgetColor,
                        fontSize: ConstantIntegers.forgetPasswordFont,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantVariables.fontFamilyPoppins,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ConstantIntegers.buttonSpace),
              SizedBox(
                width: ConstantIntegers.buttonWidth,
                height: ConstantIntegers.buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstantColors.loginBButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ConstantIntegers.buttonRadius,
                      ),
                    ),
                  ),
                  child: Text(
                    ConstantVariables.login,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ConstantIntegers.buttonLoginFont,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantVariables.fontFamilyPoppins,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
