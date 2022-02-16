import 'package:chateo/core/constants/router_name.dart';
import 'package:chateo/presentation/screens/bottom_nav_screen.dart';
import 'package:chateo/presentation/screens/otp_screen.dart';
import 'package:chateo/presentation/screens/profile_screen.dart';
import 'package:chateo/presentation/screens/verification_screen.dart';
import 'package:chateo/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_theme.dart';
import '../../logic/cubit/theme/theme_cubit.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: context.select((ThemeCubit value) => value.state.themeMode),
      title: 'Flutter Demo',
      initialRoute: RouterName.profileScreen,
      routes: {
        RouterName.homePage: (_) => BottomNavScreen(),
        RouterName.verificationScreen: (_) => VerificationScreen(),
        RouterName.otpScreen: (_) => const OtpScreen(),
        RouterName.welcomeScreen: (_) => const WelcomeScreen(),
        RouterName.profileScreen: (_) => const ProfileScreen(),
      },
    );
  }
}
