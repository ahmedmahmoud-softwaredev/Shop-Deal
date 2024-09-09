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
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWithCreditCardView extends StatelessWidget {
  const PayWithCreditCardView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocConsumer<CheckoutCubit, CheckoutState>(
                listener: (context, state) {
                  if (state is SendOrderSuccessState) {
                    sl<CartCubit>().deleteCart();
                    showSnackBar(
                      context: context,
                      message: S.of(context).yourOrderHasBeenPlacedSuccessfuly,
                      snackBarType: SnackBarType.success,
                    );
                    context.go(
                      AppRouter.rootView,
                    );
                  }
                },
                builder: (context, state) {
                  WebViewController controller = WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onPageStarted: (String url) {
                          if (url.contains("success=true")) {
                            OrderModel order = OrderModel(
                              orderBuyerId: currentUser!.uid,
                              order: List.generate(
                                  sl<CartCubit>().cartItems.length, (index) {
                                return OrderProductModel(
                                  productId: sl<CartCubit>()
                                      .cartItems[index]
                                      .product
                                      .productId,
                                  quantity:
                                      sl<CartCubit>().cartItems[index].quantity,
                                  size: sl<CartCubit>().cartItems[index].size,
                                  color: sl<CartCubit>().cartItems[index].color,
                                  productImage: sl<CartCubit>()
                                      .cartItems[index]
                                      .product
                                      .image,
                                );
                              }),
                              orderDate: DateTime.now().toString(),
                              address: sl<AddressCubit>().selectedAddress!,
                              paymentMethod: paymentMethods(context)[
                                      sl<CheckoutCubit>()
                                          .selectedPaymentMethod!]
                                  .title,
                              orderTotalPrice:
                                  sl<CartCubit>().totalPrice.toString(),
                              orderId: "",
                              orderStatus: AppConstants.orderSigned,
                            );
                            sl<CheckoutCubit>().sendOrder(order: order);
                          } else if (url.contains("success=false")) {
                            GoRouter.of(context).pop();
                            showSnackBar(
                              context: context,
                              message: S.of(context).payFailed,
                              snackBarType: SnackBarType.error,
                            );
                          }
                        },
                      ),
                    );
                  if (state is SendOrderLoadingState) {
                    return const CustomLoadingWidget();
                  } else if (state is SendOrderFailureState) {
                    return const CustomErrorWidget();
                  } else {
                    return Scaffold(
                      appBar: customAppBar(title: S.of(context).pay),
                      body: WebViewWidget(
                        controller: controller
                          ..loadRequest(
                            Uri.parse(
                              visaIFrameUrl(
                                  orderToken:
                                      sl<CheckoutCubit>().orderPayToken!),
                            ),
                          ),
                      ),
                    );
                  }
                },
              )
            : state is InternetNotConnectedState
                ? const NoNetworkConnectionView()
                : const CustomLoadingView();
      },
    );
  }
}
