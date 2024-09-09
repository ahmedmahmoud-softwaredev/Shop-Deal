import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/cart/models/cart_item_model.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit() : super(ItemDetailsInitialState());
  static ItemDetailsCubit get(context) => BlocProvider.of(context);
  bool isInWishList = false;
  int selectedSize = 0;
  int selectedColor = 0;
  void addToCart({
    required ProductModel product,
  }) {
    emit(AddToCartLoadingState());
    bool isInCart = false;
    CartItemModel cartItem = CartItemModel(
      product: product,
      quantity: 1,
      color: product.colors != null ? product.colors![selectedColor] : null,
      size: product.sizes != null ? product.sizes![selectedSize] : null,
    );

    var cartBox = Hive.box<CartItemModel>(kCartItemsBox);
    for (var cartItemModel in cartBox.values) {
      if (cartItemModel.product.productId == product.productId) {
        isInCart = true;
      }
    }
    if (!isInCart) {
      cartBox.add(cartItem).then((value) {
        emit(AddToCartSuccessState());
      }).catchError((error) {
        emit(
          AddToCartFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    } else {
      emit(IsInCartState());
    }
  }

  void addToWishList({
    required ProductModel item,
  }) {
    emit(WishListLoadingState());
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
        emit(AddToWishListSuccessState());
      }).catchError((error) {
        emit(
          WishListFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    }
  }

  void checkIsInWishList({required ProductModel item}) {
    var wishlistBox = Hive.box<ProductModel>(kWishListBox);
    for (var product in wishlistBox.values) {
      if (product.productId == item.productId) {
        isInWishList = true;
      }
    }

    emit(CheckIsInWishListSuccessState());
  }

  void removeFromWishList({required ProductModel product}) {
    var wishlistBox = Hive.box<ProductModel>(kWishListBox);
    for (var item in wishlistBox.values) {
      if (item.productId == product.productId) {
        int index = wishlistBox.values.toList().indexOf(item);
        wishlistBox.deleteAt(index).then((value) {
          isInWishList = false;
          emit(RemoveFromWishListSuccessState());
        }).catchError((error) {
          emit(
            WishListFailureState(
              errorMessage: error.toString(),
            ),
          );
        });
      }
    }
  }

  changeSelectedSize({required int newSizeIndex}) {
    selectedSize = newSizeIndex;
  }

  changeSelectedColor({required int newColorIndex}) {
    selectedColor = newColorIndex;
  }
}
