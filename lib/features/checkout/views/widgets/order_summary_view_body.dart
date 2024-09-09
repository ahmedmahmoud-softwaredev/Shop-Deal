import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/shipping_address_component.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/checkout/models/payment_method_model.dart';
import 'package:shop_deal/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:shop_deal/features/checkout/views/widgets/order_summary_payment_section.dart';
import 'package:shop_deal/features/checkout/views/widgets/order_summary_products_list_view.dart';
import 'package:shop_deal/features/checkout/views/widgets/order_summary_total_section.dart';

class OrderSummaryViewBody extends StatelessWidget {
  const OrderSummaryViewBody({
    super.key,
    required this.selectedPaymentMethodIndex,
  });
  final int selectedPaymentMethodIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderSummaryProductsListView(
                    order: sl<CartCubit>().cartItems,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Divider(
                    color: AppColors.borderGreyColor,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ShippingAddressComponent(
                        address: sl<AddressCubit>().selectedAddress!,
                        onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Divider(
                    color: AppColors.borderGreyColor,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  OrderSummaryPaymentSection(
                    paymentMethod: paymentMethods(
                        context)[sl<CheckoutCubit>().selectedPaymentMethod!],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const Divider(
                    color: AppColors.borderGreyColor,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const OrderSummaryTotalSection(),
                  const SizedBox(
                    height: 84.0,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
