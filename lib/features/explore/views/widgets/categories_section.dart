import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/functions.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/explore/views/widgets/categories_list_view.dart';
import 'package:shop_deal/generated/l10n.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: isArabic() ? 0 : 16.0,
            right: isArabic() ? 16.0 : 0,
          ),
          child: Text(
            S.of(context).categories,
            style: Styles.textStyles18,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const CategoriesListView(),
      ],
    );
  }
}
