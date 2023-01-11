import 'dart:convert';
import 'package:qadamv2/util/user_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:qadamv2/util/user_secure_storage.dart';

import '../models/user.dart';

class UserService {
  static Future<List?> fetchPosts() async {
    final url = 'http://192.168.1.144:8080/admin/users';
    final uri = Uri.parse(url);
    final token = await UserSecureStorage.getUserToken();
    final response =
        await http.get(uri, headers: {'Cookie': 'Authorization=${token}'});
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
    final token = await UserSecureStorage.getUserToken();
    final url = 'http://192.168.1.144:8080/admin/users/${id}';
    final uri = Uri.parse(url);
    final response =
        await http.delete(uri, headers: {'Cookie': 'Authorization=$token'});
    return response.statusCode == 200;
  }

  static Future<bool> createUser(Map body) async {
    final token = await UserSecureStorage.getUserToken();
    const url = 'http://192.168.1.144:8080/admin/create';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Cookie': 'Authorization=$token'
    });
    return response.statusCode == 200;
  }

  static Future<User> getUser(String id) async {
    final token = await UserSecureStorage.getUserToken();
    final url = 'http://192.168.1.144:8080/admin/users/${id}';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Cookie': 'Authorization=$token'});
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final user = User.fromJson(json['users']);
    print(response.statusCode);
    return user;
  }

  static Future<bool> login(Map body) async {
    final url = 'http://192.168.1.144:8080/user/login';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    print('login status code');
    print(response.statusCode);
    print('login status code');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      UserSecureStorage.setUserToken(json["token"] as String);
    }
    return response.statusCode == 200;
  }

  static Future<User> validateUser() async {
    final token = await UserSecureStorage.getUserToken();
    const url = 'http://192.168.1.144:8080/user/validate';
    final uri = Uri.parse(url);
    final response =
        await http.get(uri, headers: {'Cookie': 'Authorization=$token'});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final user = User.fromJson(json['message']);
      return user;
    } else
      return User();
  }

  static Future<void> logOut() async{
    UserSecureStorage.clearAll();
    UserSharedPreferences.clearAll();
  }
}
