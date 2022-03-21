// import 'package:chateo/presentation/screens/bottom_nav_screen/bottom_nav_screen.dart';
// import 'package:chateo/presentation/screens/messeges_screen/messages_item_screen.dart';
// import 'package:chateo/presentation/screens/otp_screen/otp_screen.dart';
// import 'package:chateo/presentation/screens/profile_screen/profile_screen.dart';
// import 'package:chateo/presentation/screens/verification_screen/verification_screen.dart';
// import 'package:chateo/presentation/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class NR {
//   static const welcomeScreen = '/welcome_screen';
//   static const bottomNavScreen = '/';
//   static const verificationScreen = '4verification_screen';
//   static const profileScreen = 'profile_screen';
//   static const otpScreen = 'otp_screen/:phoneNumber';
//   static const chatsPage = 'chat_page';
//   static const messagesItemScreen = 'messages_item_screen';
// }

// class RoutesApp {
//   static late bool isLoggedIn;
//   static final GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//           path: NR.welcomeScreen,
//           builder: (context, state) => const WelcomeScreen(),
//           routes: [
//             GoRoute(
//               name: 'verificationScreen',
//               path: NR.verificationScreen,
//               // builder: (context, state) => const VerificationScreen(),
//               pageBuilder: (context, state) => MaterialPage(
//                 key: state.pageKey,
//                 child: const VerificationScreen(),
//               ),
//             ),
//             GoRoute(
//               name: 'otpScreen',
//               path: NR.otpScreen,
//               builder: (context, state) =>
//                   OtpScreen(phoneNumberArg: state.params['phoneNumber']!),
//             ),
//             GoRoute(
//               name: 'profileScreen',
//               path: NR.profileScreen,
//               builder: (context, state) => const ProfileScreen(),
//             ),
//           ]),
//       GoRoute(
//           name: 'bottomNavScreen',
//           path: NR.bottomNavScreen,
//           builder: (context, state) => BottomNavScreen(),
//           routes: [
//             GoRoute(
//               name: 'messagesItemScreen',
//               path: NR.messagesItemScreen,
//               builder: (context, state) => const MessagesItemScreen(),
//             ),
//           ]),
//     ],
//     errorBuilder: (context, state) => _ErrorScreen(state.error!),
//     redirect: (state) {
//       final goingToLogin = state.location == NR.verificationScreen;
//       if (!isLoggedIn && !goingToLogin) return NR.verificationScreen;
//       if (isLoggedIn && goingToLogin) return NR.bottomNavScreen;
//       // if (isLoggedIn) return NR.bottomNavScreen;
//       // state.name == NR.verificationScreen;
//       return null;
//     },
//   );
// }

// class _ErrorScreen extends StatelessWidget {
//   const _ErrorScreen(this.error, {Key? key}) : super(key: key);
//   final Exception error;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(title: const Text('My "Page Not Found" Screen')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SelectableText(error.toString()),
//               TextButton(
//                 onPressed: () => context.go('/'),
//                 child: const Text('Home'),
//               ),
//             ],
//           ),
//         ),
//       );
// }
