abstract class SharedPreferencesRepo {
   Future<bool> setStringData(String key, String value);
  Future<bool> setBoolData(String key, bool value);
  // Future<String?> getData(String key);
  Future<String?> getStringData(String key);
  Future<bool?> getBoolData(String key);
}
