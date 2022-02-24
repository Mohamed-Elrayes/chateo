import 'package:chateo/data/data_providers/shared_pref_provider.dart';
import 'package:chateo/data/interface/i_shared_pref.dart';

class SharedPrefRepo extends ISharedPref {
  final SharedPrefProvider sharedPrefProvider;
  SharedPrefRepo() : sharedPrefProvider = SharedPrefProvider();

  @override
  Future<String?> getData(String key) => sharedPrefProvider.getData(key);

  @override
  Future<bool> saveData(String key, String value) =>
      sharedPrefProvider.saveData(key, value);
}
