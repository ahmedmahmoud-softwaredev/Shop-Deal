import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitialState());
  static WishlistCubit get(context) => BlocProvider.of(context);
  List<ProductModel> wishList = [];
  void getWishlist() {
    emit(WishlistLoadingState());
    try {
      var wishlistBox = Hive.box<ProductModel>(kWishListBox);
      wishList = wishlistBox.values.toList();
      emit(WishlistSuccessState());
    } catch (error) {
      emit(
        WishlistFailureState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void removeWishListItem({required int index}) {
    var wishlistBox = Hive.box<ProductModel>(kWishListBox);
    wishlistBox.deleteAt(index).then((value) {
      getWishlist();
    }).catchError((error) {
      emit(
        WishlistFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }
}
