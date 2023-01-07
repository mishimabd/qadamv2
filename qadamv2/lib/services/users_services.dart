import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserService {
  static Future<List?> fetchPosts() async {
    final url = 'http://192.168.1.144:8080/admin/users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['users'] as List;
      return result;
    } else {
      print('something went wrong');
      return null;
    }
  }

  static Future<bool> deleteUserById(String id) async {
    final url = 'http://192.168.1.144:8080/admin/users/${id}';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode == 200;
  }

  static Future<bool> createUser(
      String name, String surname, String email) async {
    final body = {"name": 'Alish', "surname": 'Alish', "Email": 'Alish'};
    const url = 'http://192.168.1.144:8080/admin/create';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: body);
    return response.statusCode == 200;

  }

  static Future<User> getUser(String id) async {
    final url = 'http://192.168.1.144:8080/admin/users/${id}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(json['users']);
    print(user.name);
    return user;
  }

  static Future<void> login(String email, String password) async {
    final url = 'http://192.168.1.144:8080/user/login';
    final uri = Uri.parse(url);
    final body = {"Email": "admin", "password": "admin"};
    final response = await http.post(uri, body: body);
  }
}
