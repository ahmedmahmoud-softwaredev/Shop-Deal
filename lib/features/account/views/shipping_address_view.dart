import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/shipping_address_view_body.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/generated/l10n.dart';

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
