import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:chateo/logic/cubit/auth/phone_auth_cubit.dart';
import 'package:chateo/logic/cubit/profile_data/profile_data_cubit.dart';
import 'package:chateo/logic/cubit/theme/theme_cubit.dart';
import 'package:chateo/logic/cubit/timer/timer_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProvidersList {
  const BlocProvidersList._();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
    ),
    BlocProvider<ProfileDataCubit>(
      create: (context) => ProfileDataCubit(),
    ),
    BlocProvider<TimerCubit>(
      create: (context) => TimerCubit(),
    ),
    BlocProvider<PhoneAuthCubit>(
      create: (context) => PhoneAuthCubit(),
    ),
  ];
}
