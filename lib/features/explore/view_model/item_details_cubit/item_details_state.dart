part of 'item_details_cubit.dart';

sealed class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

final class ItemDetailsInitialState extends ItemDetailsState {}

final class AddToCartLoadingState extends ItemDetailsState {}

final class AddToCartSuccessState extends ItemDetailsState {}

final class AddToCartFailureState extends ItemDetailsState {
  final String errorMessage;
  const AddToCartFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class IsInCartState extends ItemDetailsState {}

final class WishListLoadingState extends ItemDetailsState {}

final class AddToWishListSuccessState extends ItemDetailsState {}

final class RemoveFromWishListSuccessState extends ItemDetailsState {}

final class WishListFailureState extends ItemDetailsState {
  final String errorMessage;
  const WishListFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CheckIsInWishListSuccessState extends ItemDetailsState {}
