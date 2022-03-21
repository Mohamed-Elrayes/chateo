import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_repo.dart';

class SharedPreferencesImpl implements SharedPreferencesRepo {

  @override
  Future<bool> setStringData(String key, String value) async {
     final _shared = await SharedPreferences.getInstance();
   return _shared.setString(key, value);
  }

  @override
  Future<String?> getStringData(String key) async {
     final _shared = await SharedPreferences.getInstance();
 return _shared.getString(key);
  } 

  @override
  Future<bool> setBoolData(String key, bool value) async {
     final _shared = await SharedPreferences.getInstance();

     return _shared.setBool(key, value);
  }

  @override
  Future<bool?> getBoolData(String key) async {
     final _shared = await SharedPreferences.getInstance();

 return _shared.getBool(key);
  } 
}
