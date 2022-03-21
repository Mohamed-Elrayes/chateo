import 'package:auto_route/auto_route.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/core/router/auth_guard.dart';
import 'package:chateo/presentation/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:chateo/presentation/screens/messeges_screen/messages_item_screen.dart';
import 'package:chateo/presentation/screens/otp_screen/otp_screen.dart';
import 'package:chateo/presentation/screens/profile_screen/profile_screen.dart';
import 'package:chateo/presentation/screens/verification_screen/verification_screen.dart';
import 'package:chateo/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/shared_pref_repo.dart';
import '../../data/repositories/shared_pref_repo.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute<MaterialPageRoute>>[
    AutoRoute(
      page: BottomNavScreen,
      initial: true,
      guards: [AuthGuard ],
    //   children: <AutoRoute<MaterialPageRoute>>[
    // AutoRoute(page: MessagesItemScreen),
    //   ]
    ),
    AutoRoute(page: MessagesItemScreen ,  guards: [AuthGuard ],),
    AutoRoute(page: WelcomeScreen),
    AutoRoute(page: VerificationScreen),
    AutoRoute(page: OtpScreen),
    AutoRoute(page: ProfileScreen),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required AuthGuard authGuard}) : super(authGuard: authGuard);
}
