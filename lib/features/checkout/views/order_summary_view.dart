import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_constants.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/checkout/models/order_model.dart';
import 'package:shop_deal/features/checkout/models/order_product_model.dart';
import 'package:shop_deal/features/checkout/models/payment_method_model.dart';
import 'package:shop_deal/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:shop_deal/features/checkout/views/widgets/order_summary_view_body.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocConsumer<CheckoutCubit, CheckoutState>(
                listener: (context, state) {
                  if (state is GetOrderPayTokenSuccessState) {
                    GoRouter.of(context).push(
                      AppRouter.payWithCreditCardView,
                      extra: sl<CheckoutCubit>().orderPayToken,
                    );
                  } else if (state is SendOrderSuccessState) {
                    sl<CartCubit>().deleteCart();
                    showSnackBar(
                      context: context,
                      message: S.of(context).yourOrderHasBeenPlacedSuccessfuly,
                      snackBarType: SnackBarType.success,
                    );
                    context.go(
                      AppRouter.rootView,
                    );
                  } else if (state is SendOrderFailureState) {
                    showSnackBar(
                      context: context,
                      message: state.errorMessage,
                      snackBarType: SnackBarType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Scaffold(
                    appBar: customAppBar(title: S.of(context).summary),
                    body: OrderSummaryViewBody(
                      selectedPaymentMethodIndex:
                          sl<CheckoutCubit>().selectedPaymentMethod!,
                    ),
                    bottomSheet: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      height: 84.0,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomMaterialButton(
                              title: S.of(context).back.toUpperCase(),
                              onPressed: () {
                                GoRouter.of(context).pop();
                              },
                              isWhite: true,
                            ),
                          ),
                          const SizedBox(
                            width: 23.0,
                          ),
                          Expanded(
                            child: state is GetOrderPayTokenLoadingState ||
                                    state is SendOrderLoadingState
                                ? const CustomLoadingWidget()
                                : state is GetOrderPayTokenFailureState ||
                                        state is SendOrderFailureState
                                    ? const CustomErrorWidget()
                                    : CustomMaterialButton(
                                        title: sl<CheckoutCubit>().selectedPaymentMethod! == 0? S.of(context).pay.toUpperCase() : S.of(context).order.toUpperCase(),
                                        onPressed: () {
                                          if (sl<CheckoutCubit>()
                                                  .selectedPaymentMethod ==
                                              0) {
                                            sl<CheckoutCubit>().paymobPay();
                                          } else {
                                            DateTime now = DateTime.now();
                                            OrderModel order = OrderModel(
                                              orderBuyerId: currentUser!.uid,
                                              order: List.generate(
                                                sl<CartCubit>()
                                                    .cartItems
                                                    .length,
                                                (index) => OrderProductModel(
                                                  productId: sl<CartCubit>()
                                                      .cartItems[index]
                                                      .product
                                                      .productId,
                                                  quantity: sl<CartCubit>()
                                                      .cartItems[index]
                                                      .quantity,
                                                  size: sl<CartCubit>()
                                                      .cartItems[index]
                                                      .size,
                                                  color: sl<CartCubit>()
                                                      .cartItems[index]
                                                      .color,
                                                  productImage: sl<CartCubit>()
                                                      .cartItems[index]
                                                      .product
                                                      .image,
                                                ),
                                              ),
                                              orderDate:
                                                  "${now.year}/${now.month}/${now.day} ${now.hour}:${now.minute}",
                                              address: sl<AddressCubit>()
                                                  .selectedAddress!,
                                              paymentMethod: paymentMethods(
                                                      context)[sl<
                                                          CheckoutCubit>()
                                                      .selectedPaymentMethod!]
                                                  .title,
                                              orderTotalPrice: sl<CartCubit>()
                                                  .totalPrice
                                                  .toString(),
                                              orderId: "",
                                              orderStatus:
                                                  AppConstants.orderSigned,
                                            );
                                            sl<CheckoutCubit>()
                                                .sendOrder(order: order);
                                          }
                                        },
                                      ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : state is InternetNotConnectedState
                ? const NoNetworkConnectionView()
                : const CustomLoadingView();
      },
    );
  }
}
