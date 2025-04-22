import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/user_login_api.dart';
import '../constants/constant_colors.dart';
import '../constants/constant_images.dart';
import '../constants/constant_integers.dart';
import '../constants/constant_variables.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageScreen createState() => LoginPageScreen();
}

class LoginPageScreen extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: container(),
      backgroundColor: ConstantColors.defaultLoginColour,
    );
  }

  Widget container() {
    return Container(
      margin: EdgeInsets.only(
        left: ConstantIntegers.loginMarginLeft,
        right: ConstantIntegers.loginMarginRight,
      ),
      child: singleChildScroll(),
    );
  }

  Widget singleChildScroll() {
    return SingleChildScrollView(child: columnContent());
  }

  Widget columnContent() {
    return Column(
      children: [
        SizedBox(height: ConstantIntegers.loginUpperSpaceHeight),
        stackLogoText(),
        SizedBox(height: ConstantIntegers.noAccountSpace),
        noAccountRow(),
        registerRow(),
        SizedBox(height: ConstantIntegers.spaceEmail),
        labelText(ConstantVariables.email),
        emailTextField(Icons.mail_outline_outlined),
        SizedBox(height: ConstantIntegers.passwordSpace),
        labelText(ConstantVariables.password),
        passwordTextField(),
        rememberMeContent(),
        SizedBox(height: ConstantIntegers.buttonSpace),
        loginButton(),
      ],
    );
  }

  Widget stackLogoText() {
    return Stack(children: [image(), textLogin()]);
  }

  Widget image() {
    return Center(
      child: Image.asset(
        ConstantImages.assetImages + ConstantImages.iParkLogo,
        height: ConstantIntegers.irixHeight,
        width: ConstantIntegers.irixWidth,
        color: ConstantColors.loginLogoColor,
      ),
    );
  }

  Widget textLogin() {
    return Center(
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
    );
  }

  Widget noAccountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [noAccountText(ConstantVariables.noAccount)],
    );
  }

  Widget noAccountText(String noAccount) {
    return Text(
      noAccount,
      style: TextStyle(
        fontSize: ConstantIntegers.noAccountSize,
        fontFamily: ConstantVariables.fontFamilyPoppins,
      ),
    );
  }

  Widget registerRow() {
    return Row(
      children: [noAccountText(ConstantVariables.youCan), registerNowButton()],
    );
  }

  Widget registerNowButton() {
    return TextButton(
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
    );
  }

  Widget labelText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: ConstantIntegers.labelText,
            fontFamily: ConstantVariables.fontFamilyPoppins,
          ),
        ),
      ],
    );
  }

  Widget emailTextField(IconData icon) {
    return TextField(controller: emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ConstantColors.iconColor),
        hintText: ConstantVariables.enterEmail,
        hintStyle: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins),
      ),
      style: TextStyle(
        color: ConstantColors.textFieldText,
        fontSize: ConstantIntegers.textFieldFontSize,
      ),
    );
  }

  Widget passwordTextField() {
    return TextField(controller: passwordController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline, color: ConstantColors.iconColor),
        suffixIcon: Icon(
          Icons.visibility_outlined,
          color: ConstantColors.iconColor,
        ),
        hintText: ConstantVariables.enterPassword,
        hintStyle: TextStyle(fontFamily: ConstantVariables.fontFamilyPoppins),
      ),
      style: TextStyle(
        color: ConstantColors.textFieldText,
        fontSize: ConstantIntegers.textFieldFontSize,
      ),
    );
  }

  Widget rememberMeContent() {
    return Row(
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
    );
  }

  Widget loginButton() {
    return SizedBox(
      width: ConstantIntegers.buttonWidth,
      height: ConstantIntegers.buttonHeight,
      child: ElevatedButton(
        onPressed: () async {
          String email = emailController.text;
          String password = passwordController.text;

          bool success = await Provider.of<UserProvider>(context, listen: false).login(email, password);
          if (success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login failed. Please try again.')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstantColors.loginBButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ConstantIntegers.buttonRadius),
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
    );
  }
}