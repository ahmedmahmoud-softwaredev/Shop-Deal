import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);
  void search({required String searchText}) {
    emit(SearchLoadingState());
    List<ProductModel> searchList = [];
    if (searchText.isNotEmpty && searchText != " ") {
      final firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore.collection(productsCollection).get().then((value) {
        for (var doc in value.docs) {
          if (doc.data()["title"].toString().contains(searchText)) {
            ProductModel product = ProductModel.fromJson(doc.data());
            searchList.add(product);
          }
        }
        emit(SearchSuccessState(searchList: searchList));
      }).catchError((error) {
        emit(
          SearchFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    } else {
      emit(SearchSuccessState(searchList: searchList));
    }
  }
}
