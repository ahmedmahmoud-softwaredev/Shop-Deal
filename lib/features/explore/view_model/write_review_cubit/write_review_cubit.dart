import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/models/review_model.dart';

part 'write_review_state.dart';

class WriteReviewCubit extends Cubit<WriteReviewState> {
  WriteReviewCubit() : super(WriteReviewInitialState());
  static WriteReviewCubit get(context) => BlocProvider.of(context);

  void sendReview(
      {required ProductModel product, required ReviewModel review}) {
    emit(WriteReviewLoadingState());
    List<ReviewModel> reviews = product.reviews ?? [];
    reviews.add(review);

    ProductModel productModel = ProductModel(
      image: product.image,
      title: product.title,
      details: product.details,
      price: product.price,
      isInStock: product.isInStock,
      category: product.category,
      productId: product.productId,
      reviews: reviews,
      sizes: product.sizes,
      colors: product.colors,
      isBestSelling: product.isBestSelling,
    );
    FirebaseFirestore.instance
        .collection(productsCollection)
        .doc(product.productId)
        .update(
          ProductModel.toMap(productModel),
        )
        .then((value) {
      emit(WriteReviewSuccesfulState());
    }).catchError((error) {
      emit(
        WriteReviewFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }
}
