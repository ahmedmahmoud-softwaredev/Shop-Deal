import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/core/widgets/custom_error_widget.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/generated/l10n.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.itemDetailsView,
            extra: product,
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      4.0,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    height: 280.0,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const CustomLoadingWidget(),
                    errorWidget: (context, url, error) =>
                        const CustomErrorWidget(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyles16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: kCurrentLanguage == "ar"
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      "Shop ",
                      style: Styles.textStyles12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Deal",
                      style: Styles.textStyles12.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                "${S.of(context).egp} ${product.price}",
                style: Styles.textStyles16.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
