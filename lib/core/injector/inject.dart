import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/core/router/auth_guard.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:chateo/data/repositories/shared_preferences/shared_preferences_impl.dart';
import 'package:chateo/logic/cubit/auth/phone_auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<FireMethodRepo>(FireMethodRepo());
  injector.registerLazySingleton<AuthGuard>(() => AuthGuard());
  injector.registerLazySingleton<AppRouter>(
      () => AppRouter(authGuard: injector<AuthGuard>()));
  // injector.registerSingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  injector.registerLazySingleton<SharedPreferencesImpl>(() => SharedPreferencesImpl());
  injector.registerFactory<PhoneAuthCubit>(() => PhoneAuthCubit());

}
