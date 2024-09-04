import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/features/explore/view_model/item_details_cubit/item_details_cubit.dart';

class FavouriteButton extends StatefulWidget {
  FavouriteButton({
    super.key,
    required this.isFavourite,
    required this.item,
  });
  final ProductModel item;
  bool isFavourite;
  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      child: IconButton(
        onPressed: () {
          ItemDetailsCubit.get(context).addToWishList(
            item: widget.item,
          );

          setState(() {
            widget.isFavourite = !widget.isFavourite;
          });
        },
        icon: widget.isFavourite
            ? const Icon(
                Icons.star_outlined,
                color: AppColors.starYellowColor,
              )
            : Icon(
                Icons.star_border_outlined,
                color: AppCubit.get(context).isDarkMode!
                    ? Colors.white
                    : Colors.black,
              ),
      ),
    );
  }
}
