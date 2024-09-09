import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/assets_constants.dart';
import 'package:shop_deal/generated/l10n.dart';

class CategoryModel extends Equatable {
  final String icon;
  final String title;
  const CategoryModel({
    required this.icon,
    required this.title,
  });

  @override
  List<Object?> get props => [
        icon,
        title,
      ];
}

List<CategoryModel> categories(BuildContext context) => [
      CategoryModel(
          icon: AssetsConstants.menCategoryIcon, title: S.of(context).men),
      CategoryModel(
          icon: AssetsConstants.womenCategoryIcon, title: S.of(context).women),
      CategoryModel(
          icon: AssetsConstants.devicesCategoryIcon,
          title: S.of(context).devices),
      CategoryModel(
          icon: AssetsConstants.gadgetsCategoryIcon,
          title: S.of(context).gadgets),
      CategoryModel(
          icon: AssetsConstants.gamingCategoryIcon,
          title: S.of(context).gaming),
    ];
