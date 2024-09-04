part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitialState extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategorySuccessfulState extends CategoryState {}

final class CategoryFailureState extends CategoryState {
  final String errorMessage;
  const CategoryFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
