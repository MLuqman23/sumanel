import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, dynamic>> signUp(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      body: {'email': email, 'password': password},
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {'email': email, 'password': password},
    );
    return json.decode(response.body);
  }
}
