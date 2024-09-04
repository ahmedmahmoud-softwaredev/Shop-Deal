import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.text, required this.icon, required this.onPressed});
  final String text;
  final String icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(
        vertical: 18.0,
        horizontal: 30.0,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.borderGreyColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.175,
          ),
          Text(
            text,
            style: Styles.textStyles14.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
