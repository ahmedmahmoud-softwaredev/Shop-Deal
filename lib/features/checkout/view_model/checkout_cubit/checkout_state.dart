part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitialState extends CheckoutState {}

final class StepIndexChangedInitialState extends CheckoutState {}

final class StepIndexChangedSuccessfulyState extends CheckoutState {}

final class GetOrderPayTokenLoadingState extends CheckoutState {}

final class GetOrderPayTokenSuccessState extends CheckoutState {}

final class GetOrderPayTokenFailureState extends CheckoutState {
  final String errorMessage;
  const GetOrderPayTokenFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class PaymentMethodSelectedSuccessfulyState extends CheckoutState {}

final class SendOrderLoadingState extends CheckoutState {}

final class SendOrderSuccessState extends CheckoutState {}

final class SendOrderFailureState extends CheckoutState {
  final String errorMessage;
  const SendOrderFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
