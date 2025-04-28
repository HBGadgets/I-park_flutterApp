import 'package:flutter/material.dart';
import 'package:hb/view/ui/tabBar/homeTab/add_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../view/constants/constant_url.dart';
import '../view/ui/tabBar/homeTab/home.dart';

class AuthService {
  final String apiUrl = ConstantUrl.loginUrl;
  String? keyToken;

  Future<bool> login(BuildContext context, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        keyToken = data['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', keyToken!);

        Map<String, dynamic> decodedToken = JwtDecoder.decode(keyToken!);
        int userRole = decodedToken['role'];

        if (userRole == 5) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddCustomerScreen()),
          );
        } else if (userRole == 4) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      await prefs.remove('token');
      keyToken = null;
    }
  }
}