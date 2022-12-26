import 'package:flutter/material.dart';
import '../models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userController = UserController(UserRepository());
    userController.fetchUserList();
    const title = 'Product List';
    return MaterialApp(
      title: title,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffdddddd)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: FutureBuilder<List<User>>(
          future: userController.fetchUserList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('error'),
              );
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                var user=snapshot.data?[index];
                return Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: Text('a')),
                      Expanded(flex: 3,child: Text('a')),
                      Expanded(flex: 3,child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 0.5, height: 0.5);
              },
              itemCount: snapshot.data?.length ?? 0,
            );
          },
        ),
      ),
    );
  }
}
