import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  int? iD;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? surname;
  String? email;
  String? password;

  User(
      {this.iD,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.name,
        this.surname,
        this.email,
        this.password});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['name'];
    surname = json['surname'];
    email = json['Email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD ;
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['DeletedAt'] = this.deletedAt;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['Email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

abstract class Repository {
  Future<List<User>> getUserList();
  Future<String> createUser(User user);
}

class UserRepository implements Repository {
  String dataURL = 'http://192.168.1.144:8080';

  @override
  Future<List<User>> getUserList() async {
    List<User> userList = [];
    var url = Uri.parse('${dataURL}/admin/users');
    var response = await http.get(url);
    print('status code: ${response.statusCode}');
    var body = jsonDecode(response.body);
    for (var i = 0; i < body.length; i++) {
      // userList.add(User.fromJson(body[i]));
      print('body : $body \n body[0] : ${body[0]}');
    }
    return userList;
  }

  @override
  Future<String> createUser(User user) async {
    var url = Uri.parse('${dataURL}/admin/create');
    var response = await http.post(url, body: user.toJson);
    print('status code: ${response.statusCode}');
    print('status code: ${response.body}');
    return 'true';
  }


}

class UserController {
  final Repository _repository;

  UserController(this._repository);

  Future<List<User>> fetchUserList() async {
    return _repository.getUserList();
  }

  Future<String> postUser(User user) async{
    return _repository.createUser(user);
  }
}