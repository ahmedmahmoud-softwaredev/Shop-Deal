import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/assets_constants.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/features/account/views/widgets/account_list_tile.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:shop_deal/generated/l10n.dart';

class ThemeViewBody extends StatelessWidget {
  const ThemeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AccountListTile(
                icon: kIsDarkMode!
                    ? DarkModeAssetsConstants.lightModeIcon
                    : AssetsConstants.lightModeIcon,
                title: S.of(context).lightMode,
                onPressed: () {
                  AppCubit.get(context).changeThemeMode(isDark: false);
                },
              ),
              AccountListTile(
                icon: kIsDarkMode!
                    ? DarkModeAssetsConstants.darkModeIcon
                    : AssetsConstants.darkModeIcon,
                title: S.of(context).darkMode,
                onPressed: () {
                  AppCubit.get(context).changeThemeMode(isDark: true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
