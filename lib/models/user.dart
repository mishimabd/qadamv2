import 'package:dio/dio.dart';

class User{
  int id;
  String name;
  String surname;
  String email;

  User(this.id, this.name, this.surname, this.email);


  factory User.fromJson(Map json) {
    return User(
        json['id'],
        json['name'],
        json['surname'],
        json['email']
    );
  }
}

class ProductService {
  final String productsURL = 'http://localhost:8080/users';
  final Dio dio = Dio();

  ProductService();

  Future<List<User>> getProducts() async {
    late List<User> users;
    try {
      final res = await dio.get(productsURL);

      users = res.data['products']
          .map<User>(
            (item) => User.fromJson(item),
      )
          .toList();
    }
    on DioError catch(e) {
      print(e.message);
    }

    return users;
  }
}