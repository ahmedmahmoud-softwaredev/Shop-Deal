import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/helpers/paymob_helper.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:online_shop/features/checkout/models/order_model.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitialState());
  static CheckoutCubit get(context) => BlocProvider.of(context);

  int stepIndex = 0;
  int? selectedPaymentMethod;
  String? orderPayToken;

  void changeStepIndex({
    required bool isNext,
  }) {
    emit(StepIndexChangedInitialState());
    isNext ? ++stepIndex : --stepIndex;
    emit(StepIndexChangedSuccessfulyState());
  }

  void zeroStepIndex() {
    emit(StepIndexChangedInitialState());
    stepIndex = 0;
    emit(StepIndexChangedSuccessfulyState());
  }

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

  void selectPaymentMethod({required int index}) {
    emit(CheckoutInitialState());
    selectedPaymentMethod = index;
    emit(PaymentMethodSelectedSuccessfulyState());
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
          stepIndex = 0;
          selectedPaymentMethod == null;
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
