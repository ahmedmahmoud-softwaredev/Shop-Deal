import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/core/utils/text_styles.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });
  final String icon;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        onTap: onPressed,
        contentPadding: const EdgeInsets.only(
          right: 15.0,
        ),
        leading: SvgPicture.asset(
          icon,
        ),
        title: Text(
          title,
          style: Styles.textStyles18.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18.0,
        ),
      ),
    );
  }
}
