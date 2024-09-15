import 'package:flutter/material.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/views/widgets/product_widget.dart';

class RecommendedViewBody extends StatelessWidget {
  const RecommendedViewBody({super.key, required this.recommendedProducts});
  final List<ProductModel> recommendedProducts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / 900,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) => ProductWidget(
        product: recommendedProducts[index],
      ),
      itemCount: recommendedProducts.length,
    );
  }
}
