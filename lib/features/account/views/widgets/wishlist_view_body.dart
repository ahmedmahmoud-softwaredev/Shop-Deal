import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/features/account/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/wishlist_component.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/empty_widget.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/generated/l10n.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: BlocConsumer<WishlistCubit, WishlistState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> wishList = WishlistCubit.get(context).wishList;
          if (state is WishlistLoadingState) {
            return const CustomLoadingWidget();
          } else if (state is WishlistFailureState) {
            return const CustomErrorWidget(
              size: 48.0,
            );
          } else {
            return wishList.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) => Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            flex: 1,
                            onPressed: (context) {
                              WishlistCubit.get(context)
                                  .removeWishListItem(index: index);
                            },
                            backgroundColor: AppColors.redColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_outline_rounded,
                          ),
                        ],
                      ),
                      child: WishlistComponent(
                        product: wishList[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16.0,
                    ),
                    itemCount: wishList.length,
                  )
                : EmptyWidget(
                    text: S.of(context).thereIsNothingInWishlistYet,
                  );
          }
        },
      ),
    );
  }
}
