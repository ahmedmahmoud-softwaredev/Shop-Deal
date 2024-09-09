import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/view_model/item_details_cubit/item_details_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/item_details_view_body.dart';
import 'package:shop_deal/generated/l10n.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        ItemDetailsCubit()..checkIsInWishList(item: item),
                  ),
                  BlocProvider(
                    create: (context) => CartCubit(),
                  ),
                ],
                child: Scaffold(
                  body: ItemDetailsViewBody(
                    item: item,
                  ),
                  bottomSheet: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    height: 84.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).price.toUpperCase(),
                              style: Styles.textStyles12,
                            ),
                            Text(
                              "${S.of(context).egp} ${item.price}",
                              style: Styles.textStyles18.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100.0,
                        ),
                        Expanded(
                          child:
                              BlocConsumer<ItemDetailsCubit, ItemDetailsState>(
                            listener: (context, state) {
                              if (state is AddToCartFailureState) {
                                showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .thereIsSomethingWrongHappened,
                                  snackBarType: SnackBarType.success,
                                );
                              } else if (state is AddToCartSuccessState) {
                                showSnackBar(
                                  context: context,
                                  message: S.of(context).addedToCartSuccessfuly,
                                  snackBarType: SnackBarType.success,
                                );
                              } else if (state is IsInCartState) {
                                showSnackBar(
                                  context: context,
                                  message: S.of(context).itsInYourCartAlready,
                                  snackBarType: SnackBarType.info,
                                );
                              } else if (state is AddToWishListSuccessState) {
                                showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .itHasBeenAddedToYourWishlist,
                                  snackBarType: SnackBarType.success,
                                );
                              } else if (state is WishListFailureState) {
                                showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .thereIsSomethingWrongHappened,
                                  snackBarType: SnackBarType.error,
                                );
                              } else if (state
                                  is RemoveFromWishListSuccessState) {
                                showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .itHasBeenRemovedFromYourWishlist,
                                  snackBarType: SnackBarType.info,
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AddToCartLoadingState) {
                                return const CustomLoadingWidget();
                              } else {
                                return CustomMaterialButton(
                                  title: item.isInStock
                                      ? S.of(context).addToCart.toUpperCase()
                                      : S.of(context).outOfStock.toUpperCase(),
                                  isDisabled: item.isInStock ? false : true,
                                  onPressed: () {
                                    ItemDetailsCubit.get(context)
                                        .addToCart(product: item);
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : state is InternetNotConnectedState
                ? const NoNetworkConnectionView()
                : const CustomLoadingView();
      },
    );
  }
}
