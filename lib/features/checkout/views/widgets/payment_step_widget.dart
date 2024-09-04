import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/checkout/models/payment_method_model.dart';
import 'package:online_shop/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:online_shop/features/checkout/views/widgets/payment_step_selection_method_widget.dart';

class PaymentStepWidget extends StatelessWidget {
  const PaymentStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => PaymentStepSelectionMethodWidget(
            paymentMethod: paymentMethods(context)[index],
            isSelected:
                CheckoutCubit.get(context).selectedPaymentMethod == index
                    ? true
                    : false,
            onPressed: () {
              CheckoutCubit.get(context).selectPaymentMethod(index: index);
            },
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20.0,
          ),
          itemCount: paymentMethods(context).length,
        );
      },
    );
  }
}
