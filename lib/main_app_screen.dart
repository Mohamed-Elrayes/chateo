import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/core/router/app_router.dart';
import 'package:chateo/logic/bloc_providers.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProvidersList.blocProviders,
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);
  final _appRouter = injector<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: FlexThemeData.light(scheme: FlexScheme.material),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.material),
      title: 'chateo',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
