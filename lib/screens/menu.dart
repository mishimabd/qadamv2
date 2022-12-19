import 'package:flutter/material.dart';
import 'package:qadamv2/theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('Profile'), leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('Setting'), leading: Icon(Icons.settings),
          )
        ],
      )
    );
  }
}
