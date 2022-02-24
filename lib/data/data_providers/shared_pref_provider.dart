import 'package:chateo/data/interface/i_shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider extends ISharedPref{
  @override
  Future<bool> saveData(String key, String value)async{
   final _shared = await SharedPreferences.getInstance();
    return _shared.setString(key, value);
  }
  @override
  Future<String?> getData(String key)async{
   final _shared = await SharedPreferences.getInstance();
   return _shared.getString(key);
  }

}