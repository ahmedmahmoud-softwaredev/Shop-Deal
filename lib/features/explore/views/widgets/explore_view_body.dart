import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/features/core/widgets/custom_error_widget.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/features/explore/view_model/explore_cubit/explore_cubit.dart';
import 'package:online_shop/features/explore/views/widgets/best_selling_section.dart';
import 'package:online_shop/features/explore/views/widgets/categories_section.dart';
import 'package:online_shop/features/explore/views/widgets/product_widget.dart';
import 'package:online_shop/features/explore/views/widgets/promo_banner.dart';
import 'package:online_shop/features/explore/views/widgets/recommended_section.dart';
import 'package:online_shop/features/explore/views/widgets/search_field.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ExploreLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is ExploreFailureState) {
          return const CustomErrorWidget();
        } else {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchField(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.searchView);
                    },
                  ),
                  const CategoriesSection(),
                  const SizedBox(
                    height: 52.0,
                  ),
                  ExploreCubit.get(context).bestSellingProducts.isNotEmpty
                      ? const BestSellingSection()
                      : const SizedBox(),
                ],
              ),
            ),
            // Best Selling gridview
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.45,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) => ProductWidget(
                  product: ExploreCubit.get(context).bestSellingProducts[index],
                ),
                itemCount:
                    ExploreCubit.get(context).bestSellingProducts.length > 4
                        ? 4
                        : ExploreCubit.get(context).bestSellingProducts.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 32.0,
                  ),
                  const PromoBanner(),
                  const SizedBox(
                    height: 32.0,
                  ),
                  ExploreCubit.get(context).recommendedProducts.isNotEmpty
                      ? const RecommendedSection()
                      : const SizedBox(),
                ],
              ),
            ),
            //Recommended gridview
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.45,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) => ProductWidget(
                  product: ExploreCubit.get(context).recommendedProducts[index],
                ),
                itemCount:
                    ExploreCubit.get(context).recommendedProducts.length > 4
                        ? 4
                        : ExploreCubit.get(context).recommendedProducts.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16.0,
              ),
            ),
          ]);
        }
      },
    );
  }
}
