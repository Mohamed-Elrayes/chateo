abstract class ISharedPref {
  Future<bool> saveData(String key, String value);
  Future<String?> getData(String key);
}
