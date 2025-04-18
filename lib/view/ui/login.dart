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
                      ConstantImages.assetImages + ConstantImages.irixLogo,
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
                          fontFamily: "Poppins",
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
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "You can",
                    style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register here !",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 13, fontFamily: "Poppins"),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter your email address",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 13, fontFamily: "Poppins"),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              SizedBox(
                width: 318.52,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 30.0,
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
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
