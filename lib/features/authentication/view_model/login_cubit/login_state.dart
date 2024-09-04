part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessfulState extends LoginState {}

final class LoginFailureState extends LoginState {
  final String errorMessage;
  const LoginFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class LoginWithGoogleLoadingState extends LoginState {}

final class LoginWithGoogleSuccessfulState extends LoginState {}

final class LoginWithGoogleFailureState extends LoginState {
  final String errorMessage;
  const LoginWithGoogleFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class LoginWithFacebookLoadingState extends LoginState {}

final class LoginWithFacebookSuccessfulState extends LoginState {}

final class LoginWithFacebookFailureState extends LoginState {
  final String errorMessage;
  const LoginWithFacebookFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class PhoneAuthLoadingState extends LoginState {}

final class PhoneAuthSuccessState extends LoginState {}

final class PhoneAuthFailureState extends LoginState {
  final String errorMessage;
  const PhoneAuthFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
