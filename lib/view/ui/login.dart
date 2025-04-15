import 'package:flutter/material.dart';

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
                    child: Image.network(
                      "https://s3-alpha-sig.figma.com/img/12fe/c62b/5708ae6137dc9a5ca7441d4803a19128?Expires=1745798400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=aQXfu1GjB0fetFF2Zmqk5rYwPafSb8eQRUpGM~oXLWVcU3QkVJOgnDjTHtqnqz0HV5WyeGE3zbuNkTQqX2mRggBT4d4fiQlM4Ia3GSy0IZvPg-PviqDrZ7i9EGF-jVtJrJKgxFk9To7uBteVMGh08ACq2j98jJrsbWI8wRf-Ly6gCYP4V41bbOzv7kB-GkiCXNEIVGuyz23CgBbwgILUVCFGfhmcvkBD2HAayDdDyMji8098IqnVorjxLWCKZ664PLamfeEkehVd9jTQJzmQ6BWTt~OknlPNUZqeZsaDxrkMDvxh4Cvq-1qMOv0FLIsXLAzDMlgzjMzKllY5nwA~Kg__",
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
              SizedBox(height: 30),

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
              SizedBox(height: 50),
              SizedBox(
                width: 318.52,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Background color
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
              SizedBox(height: 30),
              Text("or continue with", style: TextStyle(color: Colors.black)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, size: 40),
                  Icon(Icons.apple, size: 50),
                  Icon(Icons.g_mobiledata, size: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
