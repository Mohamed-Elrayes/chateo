// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:newsly_app/core/web_services/firebase/auth_provider.dart';
// import 'package:newsly_app/core/web_services/firebase/auth_user.dart';
// import 'package:newsly_app/core/web_services/firebase/firebase_web.dart';

// class AuthRepository implements AuthProvider {
//   final AuthProvider _firebaseWeb;
//   AuthRepository([firebaseWeb]) : _firebaseWeb = firebaseWeb ?? FirebaseWeb();
//   factory AuthRepository.firebase() => AuthRepository(FirebaseWeb());
//   @override
//   Future<AuthUser> createUser(
//           {required String email, required String password}) =>
//       _firebaseWeb.createUser(email: email, password: password);
//   @override
//   Future<AuthUser> login({required String email, required String password}) =>
//       _firebaseWeb.login(email: email, password: password);

//   @override
//   Future<void> googleAuth() => _firebaseWeb.googleAuth();

//   @override
//   Future<void> sendEmailVerification() => _firebaseWeb.sendEmailVerification();

//   @override
//   AuthUser? get currentUser => _firebaseWeb.currentUser;

//   @override
//   Future<void> logOut() async => _firebaseWeb.logOut();

//   @override
//   Future<void> initializeFirebase() => _firebaseWeb.initializeFirebase();
// }
