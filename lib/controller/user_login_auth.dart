import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/constants/constant_url.dart';

class AuthService {
  final String apiUrl = ConstantUrl.loginUrl;
  String? keyToken;

  Future<bool> login(String email, String password) async {
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