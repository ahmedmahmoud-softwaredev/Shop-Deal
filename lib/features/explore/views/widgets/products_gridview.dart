import 'package:flutter/material.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/views/widgets/product_widget.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) => ProductWidget(
          product: products[index],
        ),
        itemCount: products.length > 6 ? 6 : products.length,
      ),
    );
  }
}
