import 'package:flutter/material.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:shop_deal/generated/l10n.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.onPressed, this.onChanged});
  final VoidCallback? onPressed;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 46.0),
      child: TextFormField(
        onTap: onPressed ?? () {},
        onChanged: onChanged,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          filled: true,
          hintText: S.of(context).search,
          fillColor: AppCubit.get(context).isDarkMode!
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.03),
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(
            Icons.search,
            size: 28.0,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                45.0,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                45.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
