import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:shop_deal/features/checkout/views/widgets/checkout_view_body.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/generated/l10n.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    sl<AddressCubit>().getAddresses();
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocConsumer<CheckoutCubit, CheckoutState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Scaffold(
                    appBar: customAppBar(
                        title: S.of(context).checkout,
                        onPressed: () {
                          GoRouter.of(context).pop();
                          sl<CheckoutCubit>().zeroStepIndex();
                        }),
                    body: const CheckoutViewBody(),
                    bottomSheet: BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          height: 84.0,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Row(
                            children: [
                              sl<CheckoutCubit>().stepIndex > 0
                                  ? Expanded(
                                      child: CustomMaterialButton(
                                        title: S.of(context).back.toUpperCase(),
                                        onPressed: () {
                                          sl<CheckoutCubit>()
                                              .changeStepIndex(isNext: false);
                                        },
                                        isWhite: true,
                                      ),
                                    )
                                  : const Spacer(),
                              const SizedBox(
                                width: 23.0,
                              ),
                              Expanded(
                                child: CustomMaterialButton(
                                  title: S.of(context).next.toUpperCase(),
                                  isDisabled: sl<CheckoutCubit>().stepIndex == 0
                                      ? sl<AddressCubit>().addresses.isEmpty
                                      : sl<CheckoutCubit>()
                                              .selectedPaymentMethod ==
                                          null,
                                  onPressed: () {
                                    if (sl<CheckoutCubit>().stepIndex > 0) {
                                      if (sl<CheckoutCubit>()
                                              .selectedPaymentMethod !=
                                          null) {
                                        GoRouter.of(context).push(
                                          AppRouter.orderSummaryView,
                                          extra: sl<CheckoutCubit>()
                                              .selectedPaymentMethod,
                                        );
                                      }
                                    } else {
                                      if (sl<AddressCubit>()
                                          .addresses
                                          .isNotEmpty) {
                                        sl<CheckoutCubit>()
                                            .changeStepIndex(isNext: true);
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
