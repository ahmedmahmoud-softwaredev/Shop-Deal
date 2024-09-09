import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/shipping_address_component.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/empty_widget.dart';
import 'package:shop_deal/generated/l10n.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({super.key});
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
        if (state is GetAddressesLoadingState ||
            state is ChangeSelectedAddressLoadingState ||
            state is DeleteAddressLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is GetAddressesFailureState) {
          return const CustomErrorWidget();
        } else if (state is ChangeSelectedAddressFailureState) {
          return const CustomErrorWidget();
        } else if (state is DeleteAddressAddressFailureState) {
          return const CustomErrorWidget();
        } else {
          return Column(
            children: [
              Expanded(
                child: sl<AddressCubit>().addresses.isNotEmpty
                    ? ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 32.0),
                        itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) {
                                  sl<AddressCubit>()
                                      .deleteAddress(index: index);
                                },
                                backgroundColor: AppColors.redColor,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_outline_rounded,
                              ),
                            ],
                          ),
                          child: ShippingAddressComponent(
                            address: sl<AddressCubit>().addresses[index],
                            onPressed: () {
                              sl<AddressCubit>()
                                  .changeSelectedShippingAddress(index: index);
                            },
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 50.0,
                        ),
                        itemCount: sl<AddressCubit>().addresses.length,
                      )
                    : EmptyWidget(
                        text: S.of(context).thereAreNoAddressesAddedYet,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                  top: 10.0,
                ),
                child: CustomMaterialButton(
                  title: S.of(context).addNewAddress.toUpperCase(),
                  onPressed: () {
                    sl<AddressCubit>().getCurrentLocation();
                    GoRouter.of(context).push(
                      AppRouter.googleMapsView,
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
