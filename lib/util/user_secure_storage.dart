import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage{
  static final _storage=FlutterSecureStorage();

  static const _keyUserName='username';
  static const _userToken='token';
  static Future setUserName(String username) async{
    await _storage.write(key: _keyUserName, value: username);
  }

  static Future getUserName() async{
    return await _storage.read(key: _keyUserName);
  }

  static Future setUserToken(String token) async {
    await _storage.write(key: _userToken, value:token);
    print(await _storage.read(key: _userToken));
  }
  static Future getUserToken() async{
    return await _storage.read(key: _userToken);
  }

  static Future clearAll() async{
    await _storage.deleteAll();
  }

}