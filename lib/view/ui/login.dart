import 'package:flutter/material.dart';

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
        margin: EdgeInsets.only(left: 35, right: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 59),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                     "assets/images/planewhite.png",
                      height: 183,
                      width: 183,
                      color: Colors.black,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 150,
                        left: 50,
                        right: 50,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
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
                    "If you don't have an account register",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("You can", style: TextStyle(fontSize: 16)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register here !",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Email", style: TextStyle(fontSize: 13))],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter your email address",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Password", style: TextStyle(fontSize: 13))],
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (val) {}),
                      Text("Remember me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(color: Colors.black),
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
