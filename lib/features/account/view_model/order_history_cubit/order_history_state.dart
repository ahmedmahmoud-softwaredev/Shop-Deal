part of 'order_history_cubit.dart';

sealed class OrderHistoryState extends Equatable {
  const OrderHistoryState();

  @override
  List<Object> get props => [];
}

final class OrderHistoryInitialState extends OrderHistoryState {}

final class GetUserOrdersLoadingState extends OrderHistoryState {}

final class GetUserOrdersSuccessState extends OrderHistoryState {}

final class GetUserOrdersFailureState extends OrderHistoryState {
  final String errorMessage;
  const GetUserOrdersFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
