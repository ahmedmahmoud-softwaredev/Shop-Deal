import 'package:flutter/material.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/views/widgets/product_widget.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key, required this.bestSellingProducts});
  final List<ProductModel> bestSellingProducts;
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
        product: bestSellingProducts[index],
      ),
      itemCount: bestSellingProducts.length,
    );
  }
}
