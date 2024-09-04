part of 'root_cubit.dart';

sealed class RootState extends Equatable {
  const RootState();

  @override
  List<Object> get props => [];
}

final class RootInitialState extends RootState {}

final class RootLoadingState extends RootState {}

final class RootSuccessfulState extends RootState {}

final class RootFailureState extends RootState {
  final String errorMessage;
  const RootFailureState({required this.errorMessage});

  @override
  List<Object> get props => [
        errorMessage,
      ];
}

final class ScreenChangedState extends RootState {}

final class UploadProfilePicLoadingState extends RootState {}

final class UploadProfilePicSuccesState extends RootState {}

final class UploadProfilePicFailureState extends RootState {
  final String errorMessage;
  const UploadProfilePicFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class UpdateUserDataLoadingState extends RootState {}

final class UpdateUserDataSuccesState extends RootState {}

final class UpdateUserDataFailureState extends RootState {
  final String errorMessage;
  const UpdateUserDataFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
