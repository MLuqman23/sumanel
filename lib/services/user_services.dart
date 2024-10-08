import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    final List data = json.decode(response.body)['data'];
    return data.map((user) => User.fromJson(user)).toList();
  }
}
