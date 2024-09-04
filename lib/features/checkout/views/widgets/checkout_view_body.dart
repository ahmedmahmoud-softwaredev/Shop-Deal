import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:online_shop/features/checkout/views/widgets/address_step_widget.dart';
import 'package:online_shop/features/checkout/views/widgets/checkout_steps_widget.dart';
import 'package:online_shop/features/checkout/views/widgets/payment_step_widget.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CheckOutStepsWidget(
                    stepIndex: sl<CheckoutCubit>().stepIndex,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  sl<CheckoutCubit>().stepIndex == 0
                      ? AddressStepWidget()
                      : const PaymentStepWidget()
                ],
              ),
            ),
          );
        });
  }
}
