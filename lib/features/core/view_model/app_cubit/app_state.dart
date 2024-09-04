part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitialState extends AppState {}

final class LangugeChangedSuccessfulyState extends AppState {}

final class ThemeModeChangedSuccessfulyState extends AppState {}
