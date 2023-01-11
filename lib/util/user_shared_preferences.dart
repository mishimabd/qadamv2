import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserSharedPreferences{
  static void setUserData (User user)async{
    final sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isAdmin', user.role!);
    await sharedPreferences.setString('name',user.name!);
    await sharedPreferences.setString('email', user.email!);
    await sharedPreferences.setString('surname', user.surname!);
    await sharedPreferences.setInt('id', user.iD!);
  }

  static void clearAll() async{
    final sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

}