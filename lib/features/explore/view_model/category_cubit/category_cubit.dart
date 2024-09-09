import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitialState());
  static CategoryCubit get(context) => BlocProvider.of(context);
  List<ProductModel> products = [];
  void getCategoryProducts({required String category}) {
    emit(CategoryLoadingState());
    FirebaseFirestore.instance
        .collection(productsCollection)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc.data()["category"] == category) {
          ProductModel product = ProductModel.fromJson(doc.data());
          products.add(product);
        }
      }
      emit(CategorySuccessfulState());
    }).catchError((error) {
      emit(
        CategoryFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }
}
