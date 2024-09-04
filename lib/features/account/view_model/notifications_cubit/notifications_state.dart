part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitialState extends NotificationsState {}

final class GetNotificationsLoadingState extends NotificationsState {}

final class GetNotificationsSuccessState extends NotificationsState {}

final class GetNotificationsFailureState extends NotificationsState {
  final String errorMessage;
  const GetNotificationsFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
