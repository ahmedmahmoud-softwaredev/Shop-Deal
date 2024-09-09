import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/shipping_address_component.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/generated/l10n.dart';

class AddressStepWidget extends StatelessWidget {
  AddressStepWidget({
    super.key,
  });
  final TextEditingController addressTitleController = TextEditingController();
  final TextEditingController addressDetailsController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is ChangeSelectedAddressSuccessState ||
            state is DeleteAddressSuccessState ||
            state is AddAddressSuccessState) {
          sl<AddressCubit>().getAddresses();
        }
      },
      builder: (context, state) {
        return sl<AddressCubit>().addresses.isEmpty
            ? Column(
                children: [
                  Text(
                    S.of(context).thereAreNoAddressesAddedYet,
                    style: Styles.textStyles18.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 33.0,
                  ),
                  CustomMaterialButton(
                    title: S.of(context).addNewAddress.toUpperCase(),
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.shippingAddressView,
                        extra: true,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 90.0,
                  ),
                ],
              )
            : Column(
                children: [
                  state is ChangeSelectedAddressSuccessState ||
                          state is GetAddressesSuccessState ||
                          state is DeleteAddressSuccessState
                      ? ShippingAddressComponent(
                          address: sl<AddressCubit>().selectedAddress!,
                          onPressed: () {},
                        )
                      : const CustomLoadingWidget(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomMaterialButton(
                    title: S.of(context).changeAddress.toUpperCase(),
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.shippingAddressView,
                      );
                    },
                  ),
                ],
              );
      },
    );
  }
}
