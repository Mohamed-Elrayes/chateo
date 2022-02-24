import '../../core/constants/router_name.dart';
import 'bottom_nav_screen/bottom_nav_screen.dart';
import 'otp_screen/otp_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'verification_screen/verification_screen.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_theme.dart';
import '../../logic/cubit/theme/theme_cubit.dart';
import '../../logic/cubit/timer/timer_cubit.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: context.select((ThemeCubit value) => value.state.themeMode),
      title: 'chateo',
      initialRoute: RouterName.welcomeScreen,
      routes: {
        RouterName.welcomeScreen: (_) => const WelcomeScreen(),
        RouterName.bottomNavScreen: (_) => BottomNavScreen(),
        RouterName.verificationScreen: (_) => VerificationScreen(),
        RouterName.otpScreen: (_) => const OtpScreen(),
        RouterName.profileScreen: (_) => const ProfileScreen(),
      },
    );
  }
}
