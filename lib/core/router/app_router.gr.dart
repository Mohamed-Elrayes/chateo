// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavRoute.name: (routeData) {
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData, child: const BottomNavScreen());
    },
    MessagesItemRoute.name: (routeData) {
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData, child: const MessagesItemScreen());
    },
    WelcomeRoute.name: (routeData) {
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData, child: const WelcomeScreen());
    },
    VerificationRoute.name: (routeData) {
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData, child: const VerificationScreen());
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData,
          child: OtpScreen(key: args.key, phoneNumberArg: args.phoneNumberArg));
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<MaterialPageRoute<dynamic>>(
          routeData: routeData, child: const ProfileScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(BottomNavRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(MessagesItemRoute.name,
            path: '/messages-item-screen', guards: [authGuard]),
        RouteConfig(WelcomeRoute.name, path: '/welcome-screen'),
        RouteConfig(VerificationRoute.name, path: '/verification-screen'),
        RouteConfig(OtpRoute.name, path: '/otp-screen'),
        RouteConfig(ProfileRoute.name, path: '/profile-screen')
      ];
}

/// generated route for
/// [BottomNavScreen]
class BottomNavRoute extends PageRouteInfo<void> {
  const BottomNavRoute() : super(BottomNavRoute.name, path: '/');

  static const String name = 'BottomNavRoute';
}

/// generated route for
/// [MessagesItemScreen]
class MessagesItemRoute extends PageRouteInfo<void> {
  const MessagesItemRoute()
      : super(MessagesItemRoute.name, path: '/messages-item-screen');

  static const String name = 'MessagesItemRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<void> {
  const VerificationRoute()
      : super(VerificationRoute.name, path: '/verification-screen');

  static const String name = 'VerificationRoute';
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({Key? key, required String phoneNumberArg})
      : super(OtpRoute.name,
            path: '/otp-screen',
            args: OtpRouteArgs(key: key, phoneNumberArg: phoneNumberArg));

  static const String name = 'OtpRoute';
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.phoneNumberArg});

  final Key? key;

  final String phoneNumberArg;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phoneNumberArg: $phoneNumberArg}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-screen');

  static const String name = 'ProfileRoute';
}
