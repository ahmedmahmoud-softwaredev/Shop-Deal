import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/google_maps_view_body.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/generated/l10n.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: S.of(context).locateYourLocationOnTheMap,
      ),
      body: const GoogleMapsViewBody(),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        height: 80.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return CustomMaterialButton(
                title: S.of(context).confirmLocation.toUpperCase(),
                isDisabled:
                    state is GetCurrentLocationSuccessState ? false : true,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(
                    AppRouter.newAddressView,
                  );
                });
          },
        ),
      ),
    );
  }
}
