import 'presentation/screens/main_app_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/auth/phone_auth_cubit.dart';
import 'logic/cubit/profile_data/profile_data_cubit.dart';
import 'logic/cubit/theme/theme_cubit.dart';
import 'logic/cubit/timer/timer_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
         BlocProvider(
          create: (context) => ProfileDataCubit(),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
        BlocProvider(
          create: (context) => PhoneAuthCubit(),
        ),
      ],
      child: const MainAppScreen(),
    );
  }
}
