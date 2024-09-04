part of 'internet_cubit.dart';

sealed class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

final class InternetInitialState extends InternetState {}

final class InternetConnectedState extends InternetState {}

final class InternetNotConnectedState extends InternetState {}
