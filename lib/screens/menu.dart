import 'package:flutter/material.dart';
import 'package:qadamv2/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
   bool isAdmin=false;
  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  void init() async{
    final sharedPref=await SharedPreferences.getInstance();
    bool holder = await sharedPref.getBool('isAdmin')!;
    setState(() {
      isAdmin=holder;
    });
  }

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
          if(isAdmin)...[
            InkWell(
              child:ListTile(
                title: Text('Admin'), leading: Icon(Icons.admin_panel_settings),
              ),
              onTap: (){
                Navigator.of(context).pushNamed('/admin');
              },
            ),
          ]
        ],
      )
    );
  }
}
