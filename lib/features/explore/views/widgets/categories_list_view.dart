import 'package:flutter/widgets.dart';
import 'package:shop_deal/features/explore/models/category_model.dart';
import 'package:shop_deal/features/explore/views/widgets/category_icon_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 93.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CategoryIconWidget(
          category: categories(context)[index],
          index: index,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 20.0,
        ),
        itemCount: categories(context).length,
      ),
    );
  }
}
