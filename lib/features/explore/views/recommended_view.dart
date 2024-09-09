import 'package:flutter/material.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/views/widgets/recommended_view_body.dart';
import 'package:shop_deal/generated/l10n.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key, required this.recommendedProducts});
  final List<ProductModel> recommendedProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).recommended),
      body: RecommendedViewBody(
        recommendedProducts: recommendedProducts,
      ),
    );
  }
}
