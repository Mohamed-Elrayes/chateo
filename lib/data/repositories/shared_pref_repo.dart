// import 'package:chateo/core/injector/inject.dart';
// import 'package:chateo/data/data_providers/shared_pref_provider.dart';
// import 'package:chateo/data/interface/i_shared_pref.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefRepo extends ISharedPref {
//   final SharedPrefProvider sharedPrefProvider;
//   SharedPrefRepo() : sharedPrefProvider = SharedPrefProvider();

//   @override
//   Future<String?> getStringData(String key) =>
//       sharedPrefProvider.getStringData(key);

//   @override
//   Future<bool> setStringData(String key, String value) =>
//       sharedPrefProvider.setStringData(key, value);

//   @override
//   Future<bool> setBoolData(String key, bool value) =>
//       sharedPrefProvider.setBoolData(key, value);

//   @override
//   Future<bool?> getBoolData(String key) => sharedPrefProvider.getBoolData(key);
// }
