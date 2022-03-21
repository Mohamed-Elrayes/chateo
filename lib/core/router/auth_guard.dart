import 'package:auto_route/auto_route.dart';
import 'package:chateo/data/repositories/shared_preferences/shared_preferences_impl.dart';

import '../../data/repositories/shared_pref_repo.dart';
import '../constants/api_constant.dart';
import '../injector/inject.dart';
import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final instanceSharedPref = injector<SharedPreferencesImpl>();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isSecondLook =
        await instanceSharedPref.getBoolData(SharedKey.showVerifyScreen);
    if (isSecondLook == null) {
      router.push(WelcomeRoute());
    } else if (isSecondLook) {
      router.push(VerificationRoute());
    } else {
      resolver.next(true);
      //   router.push( ProfileRoute());
      // ProfileRoute();
      // resolver.next(true);
    }
  }
}
