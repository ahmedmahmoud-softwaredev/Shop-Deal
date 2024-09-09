import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/explore/view_model/explore_cubit/explore_cubit.dart';
import 'package:shop_deal/generated/l10n.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).recommended,
                style: Styles.textStyles18,
              ),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.recommendedView,
                    extra: ExploreCubit.get(context).recommendedProducts,
                  );
                },
                child: Text(
                  S.of(context).seeAll,
                  style: Styles.textStyles16.copyWith(
                    color: kIsDarkMode! ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }
}
