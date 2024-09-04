import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/helpers/paymob_helper.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit() : super(OrderSummaryInitialState());
  static OrderSummaryCubit get(context) => BlocProvider.of(context);
  String? orderPayToken;

  void paymobPay() async {
    emit(GetOrderPayTokenLoadingState());
    String totalPrice = (sl<CartCubit>().totalPrice * 100).toStringAsFixed(2);
    PaymobHelper.paymobPay(totalPrice: totalPrice).then((orderToken) {
      orderPayToken = orderToken;
      emit(GetOrderPayTokenSuccessState());
    }).catchError((error) {
      emit(
        GetOrderPayTokenFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void sendOrder({required OrderModel order}) {
    emit(SendOrderLoadingState());
    FirebaseFirestore.instance
        .collection(kOrdersCollection)
        .get()
        .then((value) {
      int newOrderId = value.size > 0 ? value.size : 0;
      OrderModel newOrder = order.copyWith(orderId: (++newOrderId).toString());
      FirebaseFirestore.instance
          .collection(kOrdersCollection)
          .doc(newOrder.orderId)
          .set(
            OrderModel.toJson(newOrder),
          )
          .then(
        (value) {
          emit(SendOrderSuccessState());
        },
      ).catchError((error) {
        emit(
          SendOrderFailureState(
            errorMessage: error.toString(),
          ),
        );
      });
    }).catchError(
      (error) {
        emit(
          SendOrderFailureState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
