part of 'order_summary_cubit.dart';

sealed class OrderSummaryState extends Equatable {
  const OrderSummaryState();

  @override
  List<Object> get props => [];
}

final class OrderSummaryInitialState extends OrderSummaryState {}

final class GetOrderPayTokenLoadingState extends OrderSummaryState {}

final class GetOrderPayTokenSuccessState extends OrderSummaryState {}

final class GetOrderPayTokenFailureState extends OrderSummaryState {
  final String errorMessage;
  const GetOrderPayTokenFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class SendOrderLoadingState extends OrderSummaryState {}

final class SendOrderSuccessState extends OrderSummaryState {}

final class SendOrderFailureState extends OrderSummaryState {
  final String errorMessage;
  const SendOrderFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
