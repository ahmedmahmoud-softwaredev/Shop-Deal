import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/core/utils/assets_constants.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/core/utils/enums.dart';
import 'package:online_shop/features/account/view_model/logout_cubit/logout_cubit.dart';
import 'package:online_shop/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:online_shop/features/account/views/widgets/account_details_widget.dart';
import 'package:online_shop/features/account/views/widgets/account_list_tile.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/features/core/widgets/custom_error_widget.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/features/core/widgets/show_snackbar.dart';
import 'package:online_shop/generated/l10n.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is GetUserFailureState) {
            showSnackBar(
                context: context,
                message: state.errorMessage,
                snackBarType: SnackBarType.error);
          } else if (state is UploadProfilePicFailureState) {
            showSnackBar(
                context: context,
                message: state.errorMessage,
                snackBarType: SnackBarType.error);
          }
        },
        builder: (context, state) {
          if (state is GetUserLoadingState ||
              state is UploadProfilePicLoadingState) {
            return const CustomLoadingWidget();
          } else {
            return BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 16.0,
                    ),
                    child: Column(
                      children: [
                        state is GetUserFailureState ||
                                state is UploadProfilePicFailureState
                            ? const CustomErrorWidget()
                            : AccountDetailsWidget(
                                user: currentUser!,
                              ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.editProfileIcon
                              : AssetsConstants.editProfileIcon,
                          title: S.of(context).editProfile,
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.editProfileView);
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.shippingAddressIcon
                              : AssetsConstants.shippingAddressIcon,
                          title: S.of(context).shippingAddress,
                          onPressed: () {
                            GoRouter.of(context).push(
                                AppRouter.shippingAddressView,
                                extra: false);
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.wishlistIcon
                              : AssetsConstants.wishListIcon,
                          title: S.of(context).wishlist,
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.wishListView);
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.ordersHistoryIcon
                              : AssetsConstants.orderHistoryIcon,
                          title: S.of(context).ordersHistory,
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.orderHistoryView,
                            );
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.trackOrdersIcon
                              : AssetsConstants.trackOrderIcon,
                          title: S.of(context).trackOrders,
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.trackOrderView,
                            );
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.languageIcon
                              : AssetsConstants.languageIcon,
                          title: S.of(context).language,
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.languageView,
                            );
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.themeIcon
                              : AssetsConstants.themeIcon,
                          title: S.of(context).theme,
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.themeView,
                            );
                          },
                        ),
                        AccountListTile(
                          icon: kIsDarkMode!
                              ? DarkModeAssetsConstants.notificationsIcon
                              : AssetsConstants.notificationsIcon,
                          title: S.of(context).notifications,
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppRouter.notificationsView);
                          },
                        ),
                        BlocProvider(
                          create: (context) => LogoutCubit(),
                          child: BlocConsumer<LogoutCubit, LogoutState>(
                            listener: (context, state) {
                              if (state is LogoutSuccessState) {
                                context.go(AppRouter.logInView);
                              } else if (state is LogoutFailureState) {
                                showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .thereIsSomethingWrongHappened,
                                  snackBarType: SnackBarType.error,
                                );
                              }
                            },
                            builder: (context, state) {
                              return state is LogoutLoadingState
                                  ? const CustomLoadingWidget()
                                  : AccountListTile(
                                      icon: kIsDarkMode!
                                          ? DarkModeAssetsConstants.logoutIcon
                                          : AssetsConstants.logoutIcon,
                                      title: S.of(context).logout,
                                      onPressed: () async {
                                        LogoutCubit.get(context).logout();
                                      },
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
