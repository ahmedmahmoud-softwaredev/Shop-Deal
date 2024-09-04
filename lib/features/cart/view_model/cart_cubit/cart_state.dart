part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartSuccessfulState extends CartState {}

final class CartFailureState extends CartState {
  final String errorMessage;
  const CartFailureState({required this.errorMessage});
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

final class DeleteFromCartLoadingState extends CartState {}

final class DeleteFromCartSuccessState extends CartState {}

final class DeleteFromCartFailureState extends CartState {
  final String errorMessage;
  const DeleteFromCartFailureState({required this.errorMessage});
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

final class ProductInCartCheckedSuccessState extends CartState {}

final class EditCartItemQuantityLoadingState extends CartState {}

final class EditCartItemQuantitySuccessState extends CartState {}

final class EditCartItemQuantityFailureState extends CartState {
  final String errorMessage;
  const EditCartItemQuantityFailureState({required this.errorMessage});
  @override
  List<Object> get props => [
        errorMessage,
      ];
}

final class CartWishListLoadingState extends CartState {}

final class CartAddToWishListSuccessState extends CartState {}

final class CartWishListFailureState extends CartState {
  final String errorMessage;
  const CartWishListFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CartRemoveFromWishListSuccessState extends CartState {}

final class DeleteCartLoadingState extends CartState {}

final class DeleteCartSuccessState extends CartState {}

final class DeleteCartFailureState extends CartState {
  final String errorMessage;
  const DeleteCartFailureState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
