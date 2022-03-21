import 'package:chateo/core/injector/inject.dart';
import 'package:firebase_core/firebase_core.dart';

class InitializationApp {
  InitializationApp._();
 
  static Future ensureInitialize() async {
    await Firebase.initializeApp();
    await initializeDependencies();
  }
}
