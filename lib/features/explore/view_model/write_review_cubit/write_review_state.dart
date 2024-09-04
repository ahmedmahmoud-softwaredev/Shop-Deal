part of 'write_review_cubit.dart';

sealed class WriteReviewState extends Equatable {
  const WriteReviewState();

  @override
  List<Object> get props => [];
}

final class WriteReviewInitialState extends WriteReviewState {}

final class WriteReviewLoadingState extends WriteReviewState {}

final class WriteReviewSuccesfulState extends WriteReviewState {}

final class WriteReviewFailureState extends WriteReviewState {
  final String errorMessage;
  const WriteReviewFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
