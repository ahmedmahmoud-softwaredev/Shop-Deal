import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/cart/models/cart_item_model.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartItemModel> cartItems = [];
  double totalPrice = 0;
  bool isInWishList = false;
  void getCartItems() {
    emit(CartLoadingState());
    try {
      var cartBox = Hive.box<CartItemModel>(kCartItemsBox);
      cartItems = cartBox.values.toList();
      totalPrice = 0;
      for (var cartItem in cartItems) {
        totalPrice += cartItem.product.price * cartItem.quantity;
      }
      emit(CartSuccessfulState());
    } catch (error) {
      emit(
        CartFailureState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void editCartItemQuantity(
      {required int index, required CartItemModel cartItem}) {
    emit(EditCartItemQuantityLoadingState());
    var cartBox = Hive.box<CartItemModel>(kCartItemsBox);
    cartBox.putAt(index, cartItem).then((value) {
      totalPrice = 0;
      for (var cartItem in cartItems) {
        totalPrice += cartItem.product.price * cartItem.quantity;
      }
      emit(EditCartItemQuantitySuccessState());
    }).catchError((error) {
      emit(
        EditCartItemQuantityFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void deleteFromCart({required int index}) {
    emit(DeleteFromCartLoadingState());
    var cartBox = Hive.box<CartItemModel>(kCartItemsBox);
    cartBox.deleteAt(index).then((value) {
      getCartItems();
      emit(DeleteFromCartSuccessState());
    }).catchError((error) {
      emit(
        DeleteFromCartFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void deleteCart() {
    emit(DeleteCartLoadingState());
    try {
      var cartBox = Hive.box<CartItemModel>(kCartItemsBox);
      for (int i = cartBox.values.length - 1; i >= 0; i--) {
        cartBox.deleteAt(i);
      }
      getCartItems();
      emit(DeleteCartSuccessState());
    } catch (error) {
      emit(
        DeleteCartFailureState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void addToWishList({
    required ProductModel item,
  }) {
    emit(CartWishListLoadingState());
    var wishlistBox = Hive.box<ProductModel>(kWishListBox);
    for (var product in wishlistBox.values) {
      if (product.productId == item.productId) {
        isInWishList = true;
        removeFromWishList(product: item);
      }
    }
    if (isInWishList == false) {
      wishlistBox.add(item).then((value) {
        isInWishList = false;
        emit(CartAddToWishListSuccessState());
      }).catchError((error) {
        emit(
          CartWishListFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    }
  }

  void removeFromWishList({required ProductModel product}) {
    var wishlistBox = Hive.box<ProductModel>(kWishListBox);
    for (var item in wishlistBox.values) {
      if (item.productId == product.productId) {
        int index = wishlistBox.values.toList().indexOf(item);
        wishlistBox.deleteAt(index).then((value) {
          isInWishList = false;
          emit(CartRemoveFromWishListSuccessState());
        }).catchError((error) {
          emit(
            CartWishListFailureState(
              errorMessage: error.toString(),
            ),
          );
        });
      }
    }
  }
}
