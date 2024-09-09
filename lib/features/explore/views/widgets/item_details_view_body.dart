import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/core/widgets/arrow_back_button.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/view_model/item_details_cubit/item_details_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/favourite_button.dart';
import 'package:shop_deal/features/explore/views/widgets/item_sizes_colours_widget.dart';
import 'package:shop_deal/features/explore/views/widgets/reviews_list_view.dart';
import 'package:shop_deal/generated/l10n.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  placeholder: (context, url) => const CustomLoadingWidget(),
                  errorWidget: (context, url, error) =>
                      const CustomErrorWidget(),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Styles.textStyles26,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ItemSizesColoursWidget(
                        itemSizes: item.sizes,
                        itemColors: item.colors,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        S.of(context).details,
                        style: Styles.textStyles18,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        item.details,
                        style: Styles.textStyles14,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        S.of(context).reviews,
                        style: Styles.textStyles18,
                      ),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .push(AppRouter.writeReviewView, extra: item);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          S.of(context).writeYourReview,
                          style: Styles.textStyles14.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                item.reviews != null
                    ? ReviewsListView(
                        reviews: item.reviews!,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 98.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: 16.0,
            right: 16.0,
            child: Row(
              children: [
                const ArrowBackButton(),
                const Spacer(),
                ItemDetailsCubit.get(context).isInWishList
                    ? const SizedBox()
                    : FavouriteButton(
                        isFavourite: ItemDetailsCubit.get(context).isInWishList,
                        item: item,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
