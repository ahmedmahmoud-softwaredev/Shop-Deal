import 'package:flutter/material.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:online_shop/features/account/views/widgets/shipping_address_view_body.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/generated/l10n.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    sl<AddressCubit>().getAddresses();
    return Scaffold(
      appBar: customAppBar(title: S.of(context).shippingAddress),
      body: const ShippingAddressViewBody(),
    );
  }
}
