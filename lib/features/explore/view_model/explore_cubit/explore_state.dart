part of 'explore_cubit.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitialState extends ExploreState {}

final class ExploreLoadingState extends ExploreState {}

final class ExploreSuccessfulState extends ExploreState {}

final class ExploreFailureState extends ExploreState {
  final String errorMessage;
  const ExploreFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
