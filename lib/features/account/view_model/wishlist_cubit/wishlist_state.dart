part of 'wishlist_cubit.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

final class WishlistInitialState extends WishlistState {}

final class WishlistLoadingState extends WishlistState {}

final class WishlistSuccessState extends WishlistState {}

final class WishlistFailureState extends WishlistState {
  final String errorMessage;
  const WishlistFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
