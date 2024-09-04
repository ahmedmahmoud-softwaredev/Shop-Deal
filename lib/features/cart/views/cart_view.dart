import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/global/theme/theme_data/dark_model_theme_data/dark_mode_theme_data.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/core/utils/enums.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:online_shop/features/cart/views/widgets/cart_view_body.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/features/core/widgets/custom_error_widget.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/features/core/widgets/custom_material_button.dart';
import 'package:online_shop/features/core/widgets/show_snackbar.dart';
import 'package:online_shop/generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAddToWishListSuccessState) {
          showSnackBar(
            context: context,
            message: S.of(context).itHasBeenAddedToYourWishlist,
            snackBarType: SnackBarType.success,
          );
        } else if (state is CartRemoveFromWishListSuccessState) {
          showSnackBar(
            context: context,
            message: S.of(context).itHasBeenRemovedFromYourWishlist,
            snackBarType: SnackBarType.info,
          );
        } else if (state is CartWishListFailureState) {
          showSnackBar(
            context: context,
            message: S.of(context).thereIsSomethingWrongHappened,
            snackBarType: SnackBarType.error,
          );
        } else if (state is DeleteFromCartSuccessState) {
          showSnackBar(
            context: context,
            message: S.of(context).itHasBeenRemovedFromYourCart,
            snackBarType: SnackBarType.info,
          );
        }
      },
      builder: (context, state) {
        sl<CartCubit>().getCartItems();
        if (state is CartLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is CartFailureState) {
          return const CustomErrorWidget(
            size: 48.0,
          );
        } else {
          return Scaffold(
            body: const CartViewBody(),
            bottomSheet: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              height: 84.0,
              decoration: BoxDecoration(
                color: AppCubit.get(context).isDarkMode!
                    ? darkModeThemeData().scaffoldBackgroundColor
                    : Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).total.toUpperCase(),
                        style: Styles.textStyles12,
                      ),
                      Text(
                        "${S.of(context).egp} ${double.parse(
                          sl<CartCubit>().totalPrice.toStringAsFixed(2),
                        )}",
                        style: Styles.textStyles18.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 114.0,
                  ),
                  Expanded(
                    child: CustomMaterialButton(
                      title: S.of(context).checkout.toUpperCase(),
                      isDisabled: sl<CartCubit>().cartItems.isEmpty,
                      onPressed: () {
                        GoRouter.of(context).push(
                          AppRouter.checkoutView,
                          extra: 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
