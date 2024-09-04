import 'package:flutter/material.dart';
import 'package:online_shop/core/utils/assets_constants.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/account/views/widgets/account_list_tile.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/generated/l10n.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          AccountListTile(
            icon: kIsDarkMode!
                ? DarkModeAssetsConstants.arabicIcon
                : AssetsConstants.arabicIcon,
            title: S.of(context).arabic,
            onPressed: () {
              AppCubit.get(context).changeLanguage(language: 'ar');
            },
          ),
          AccountListTile(
            icon: kIsDarkMode!
                ? DarkModeAssetsConstants.englishIcon
                : AssetsConstants.englishIcon,
            title: S.of(context).english,
            onPressed: () {
              AppCubit.get(context).changeLanguage(language: 'en');
            },
          ),
        ],
      ),
    );
  }
}
