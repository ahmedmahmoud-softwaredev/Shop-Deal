part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

//Get user data states
final class GetUserLoadingState extends UserState {}

final class GetUserSuccessState extends UserState {}

final class GetUserFailureState extends UserState {
  final String errorMessage;
  const GetUserFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

//Upload profile pic states
final class UploadProfilePicLoadingState extends UserState {}

final class UploadProfilePicSuccesState extends UserState {}

final class UploadProfilePicFailureState extends UserState {
  final String errorMessage;
  const UploadProfilePicFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

//Update user data states
final class UpdateUserDataLoadingState extends UserState {}

final class UpdateUserDataSuccesState extends UserState {}

final class UpdateUserDataFailureState extends UserState {
  final String errorMessage;
  const UpdateUserDataFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class VerifyPhoneNumberLoadingState extends UserState {}

//Phone Auth States
final class PhoneAuthLoadingState extends UserState {}

final class PhoneAuthSuccessState extends UserState {}

final class PhoneAuthFailureState extends UserState {
  final String errorMessage;
  const PhoneAuthFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
