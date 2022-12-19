import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class User {
  final int id;
  final String name;
  final String surname;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });


  factory User.fromJson(Map json) {
    return User(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        email: json['email']
    );
  }
}

class ProductService {
  final String productsURL = 'http://172.20.10.5:8080/users';
  final Dio dio = Dio();

  ProductService();

  Future<List<User>> getProducts() async {
    late List<User> products;
    try {
      final res = await dio.get(productsURL);
      print('1');
      products = res.data['users']
          .map<User>(
            (item) => User.fromJson(item),
      )
          .toList();
    }
    on DioError catch(e) {
      products = [];
      print(e);
    }

    return products;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    const title = 'User List';

    return MaterialApp(
      title: title,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffdddddd)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: FutureBuilder<List<User>>(
          future: _productService.getProducts(),
          builder: (context, snapshot) {
            var products = snapshot.data ?? [];

            if(!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return ListTile(
                    title: Text(products[index].name),
                    subtitle: Text('${product.id} ${product.surname}'),
                    trailing: Text('${product.email}')
                );
              },
            );
          },
        ),
      ),
    );
  }
}

