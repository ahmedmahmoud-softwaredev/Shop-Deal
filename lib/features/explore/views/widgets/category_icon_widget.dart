import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/explore/models/category_model.dart';

class CategoryIconWidget extends StatelessWidget {
  const CategoryIconWidget(
      {super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.categoryView,
          extra: index,
        );
      },
      child: Column(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  45.0,
                ),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                category.icon,
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            category.title,
            style: Styles.textStyles12,
          ),
        ],
      ),
    );
  }
}
