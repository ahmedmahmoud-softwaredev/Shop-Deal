import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/explore/view_model/explore_cubit/explore_cubit.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ExploreCubit.get(context).banners.isNotEmpty
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  4.0,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: ExploreCubit.get(context).banners[
                    Random().nextInt(ExploreCubit.get(context).banners.length)],
                placeholder: (context, url) => const CustomLoadingWidget(),
                errorWidget: (context, url, error) => const CustomErrorWidget(),
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.fill,
              ),
            ),
          )
        : const SizedBox();
  }
}
