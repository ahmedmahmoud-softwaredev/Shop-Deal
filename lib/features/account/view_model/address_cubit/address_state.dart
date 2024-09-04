part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitialState extends AddressState {}

final class GetAddressesLoadingState extends AddressState {}

final class GetAddressesSuccessState extends AddressState {}

final class GetAddressesFailureState extends AddressState {
  final String errorMessage;
  const GetAddressesFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class AddAddressLoadingState extends AddressState {}

final class AddAddressSuccessState extends AddressState {}

final class AddAddressFailureState extends AddressState {
  final String errorMessage;
  const AddAddressFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ChangeSelectedAddressLoadingState extends AddressState {}

final class ChangeSelectedAddressSuccessState extends AddressState {}

final class ChangeSelectedAddressFailureState extends AddressState {
  final String errorMessage;
  const ChangeSelectedAddressFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class DeleteAddressLoadingState extends AddressState {}

final class DeleteAddressSuccessState extends AddressState {}

final class DeleteAddressAddressFailureState extends AddressState {
  final String errorMessage;
  const DeleteAddressAddressFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class GetCurrentLocationLoadingState extends AddressState {}

final class GetCurrentLocationSuccessState extends AddressState {}

final class GetCurrentLocationFailureState extends AddressState {
  final String errorMessage;
  const GetCurrentLocationFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
