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
          InkWell(
            child:ListTile(
              title: Text('Profile'), leading: Icon(Icons.person),
            ),
            onTap: (){
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          ListTile(
            title: Text('Setting'), leading: Icon(Icons.settings),
          ),
          InkWell(
            child:ListTile(
              title: Text('Admin'), leading: Icon(Icons.admin_panel_settings),
            ),
            onTap: (){
              Navigator.of(context).pushNamed('/admin');
            },
          ),
        ],
      )
    );
  }
}
