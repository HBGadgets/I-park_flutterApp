import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> login(String email, String password) async {
  final String apiUrl = 'https://i-park.onrender.com/api/user/login';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      print('Login successful: ${data['token']}');
      return true;
    } else {

      print('Login failed: ${response.body}');
      return false;
    }
  } catch (e) {
    print('Error: $e');
    return false;
  }
}