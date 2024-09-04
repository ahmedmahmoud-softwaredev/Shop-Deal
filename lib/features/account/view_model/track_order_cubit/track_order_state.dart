part of 'track_order_cubit.dart';

sealed class TrackOrderState extends Equatable {
  const TrackOrderState();

  @override
  List<Object> get props => [];
}

final class TrackOrderInitialState extends TrackOrderState {}

final class GetUserOrdersLoadingState extends TrackOrderState {}

final class GetUserOrdersSuccessState extends TrackOrderState {}

final class GetUserOrdersFailureState extends TrackOrderState {
  final String errorMessage;
  const GetUserOrdersFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
