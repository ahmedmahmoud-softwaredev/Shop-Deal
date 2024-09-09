import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/assets_constants.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:shop_deal/features/root/view_model/root_cubit/root_cubit.dart';
import 'package:shop_deal/features/root/views/widgets/bottom_navbar_item.dart';
import 'package:shop_deal/generated/l10n.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 84.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomNavbarItem(
                    text: S.of(context).explore,
                    icon: AppCubit.get(context).isDarkMode!
                        ? DarkModeAssetsConstants.exploreIcon
                        : AssetsConstants.exploreIcon,
                    index: 0,
                    isSelected: RootCubit.get(context).selectedScreen == 0,
                  ),
                  BottomNavbarItem(
                    text: S.of(context).cart,
                    icon: AppCubit.get(context).isDarkMode!
                        ? DarkModeAssetsConstants.cartIcon
                        : AssetsConstants.cartIcon,
                    index: 1,
                    isSelected: RootCubit.get(context).selectedScreen == 1,
                  ),
                  BottomNavbarItem(
                    text: S.of(context).account,
                    icon: AppCubit.get(context).isDarkMode!
                        ? DarkModeAssetsConstants.accountIcon
                        : AssetsConstants.accountIcon,
                    index: 2,
                    isSelected: RootCubit.get(context).selectedScreen == 2,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
