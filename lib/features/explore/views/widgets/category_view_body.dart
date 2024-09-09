import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/features/explore/view_model/category_cubit/category_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/products_gridview.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            customAppBar(title: category),
            Expanded(
              child: ProductsGridview(
                products: CategoryCubit.get(context).products,
              ),
            ),
          ],
        );
      },
    );
  }
}


/*

 */