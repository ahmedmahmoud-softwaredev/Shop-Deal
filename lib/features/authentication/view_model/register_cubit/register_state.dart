part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitialState extends RegisterState {}

final class RegisterSuccessFulState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String errorMessage;

  const RegisterFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CreateUserSuccessFulState extends RegisterState {}

final class CreateUserLoadingState extends RegisterState {}

final class CreateUserFailureState extends RegisterState {
  final String errorMessage;

  const CreateUserFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class PhoneAuthLoadingState extends RegisterState {}

final class PhoneAuthSuccessState extends RegisterState {}

final class PhoneAuthFailureState extends RegisterState {
  final String errorMessage;

  const PhoneAuthFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
