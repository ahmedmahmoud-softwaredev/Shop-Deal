import 'package:flutter/material.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/features/explore/views/widgets/product_widget.dart';

class RecommendedViewBody extends StatelessWidget {
  const RecommendedViewBody({super.key, required this.recommendedProducts});
  final List<ProductModel> recommendedProducts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.45,
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
