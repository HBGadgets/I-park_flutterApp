import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String? keyToken;
  String? get token => keyToken;

  Future<bool> login(String email, String password) async {
    final String apiUrl = 'https://i-park.onrender.com/api/user/login';

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

        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('token')) {
      await prefs.remove('token');
      keyToken = null;
      notifyListeners();
    }
  }
}
