import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/authentication/models/user_model.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';

class AccountDetailsWidget extends StatelessWidget {
  const AccountDetailsWidget({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              60.0,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: user.image!,
            placeholder: (context, url) => const CustomLoadingWidget(),
            errorWidget: (context, url, error) => const CustomErrorWidget(),
            height: 120.0,
            width: 120.0,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Styles.textStyles20.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 9.0,
              ),
              Text(
                user.email,
                style: Styles.textStyles14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
