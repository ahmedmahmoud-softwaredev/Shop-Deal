import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/explore/models/product_model.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitialState());
  static ExploreCubit get(context) => BlocProvider.of(context);
  List<ProductModel> products = [];
  List<ProductModel> bestSellingProducts = [];
  List<ProductModel> recommendedProducts = [];
  List<String> banners = [];
  void getProducts() {
    emit(ExploreLoadingState());
    FirebaseFirestore.instance.collection(productsCollection).get().then(
      (value) {
        for (var doc in value.docs) {
          ProductModel product = ProductModel.fromJson(doc.data());
          products.add(product);
          if (product.isBestSelling == true && product.isRecommended == true) {
            bestSellingProducts.add(product);
            recommendedProducts.add(product);
          } else if (product.isBestSelling == true) {
            bestSellingProducts.add(product);
          } else if (product.isRecommended == true) {
            recommendedProducts.add(product);
          }
        }
        getBanners();
      },
    ).catchError(
      (error) {
        emit(
          ExploreFailureState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  void getBanners() {
    FirebaseFirestore.instance
        .collection(kBannersCollection)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        banners.add(doc.data()["bannerImage"]);
      }
      emit(ExploreSuccessfulState());
    }).catchError(
      (error) {
        emit(
          ExploreFailureState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
