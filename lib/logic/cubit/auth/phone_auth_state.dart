part of 'phone_auth_cubit.dart';

enum AuthStatus { loading, failed, success, otpVerified , initial }

@immutable
class PhoneAuthState extends Equatable {
  // final User user;
  final AuthStatus authStatus;
  final String? errorMessage;
  const PhoneAuthState({
    // this.user = '',
    this.authStatus = AuthStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [authStatus];

  PhoneAuthState copyWith({
    // User? user,
    AuthStatus? authStatus,
    String? errorMessage,
  }) {
    return PhoneAuthState(
      // user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
