import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';

part 'track_order_state.dart';

class TrackOrderCubit extends Cubit<TrackOrderState> {
  TrackOrderCubit() : super(TrackOrderInitialState());
  static TrackOrderCubit get(context) => BlocProvider.of(context);
  List<OrderModel> userOrders = [];
  void getUserOrder() {
    emit(GetUserOrdersLoadingState());
    userOrders = [];
    FirebaseFirestore.instance.collection(kOrdersCollection).get().then(
      (collection) {
        if (collection.size > 0) {
          for (var doc in collection.docs) {
            if (doc.data()["orderBuyerId"] == currentUser!.uid) {
              OrderModel order = OrderModel.fromjson(doc.data());
              userOrders.add(order);
            }
          }
        }
        emit(GetUserOrdersSuccessState());
      },
    ).catchError((error) {
      emit(
        GetUserOrdersFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }
}
