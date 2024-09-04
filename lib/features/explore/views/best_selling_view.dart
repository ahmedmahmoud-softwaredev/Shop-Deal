import 'package:flutter/material.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/features/explore/views/widgets/best_selling_view_body.dart';
import 'package:online_shop/generated/l10n.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key, required this.bestSellingProducts});
  final List<ProductModel> bestSellingProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).bestSelling),
      body: BestSellingViewBody(
        bestSellingProducts: bestSellingProducts,
      ),
    );
  }
}
