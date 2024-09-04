import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/features/root/view_model/root_cubit/root_cubit.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.index,
  });
  final String text;
  final String icon;
  final int index;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RootCubit.get(context).changeSelectedScreen(index: index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSelected
              ? Center(
                  child: Text(
                    text,
                    style: Styles.textStyles14.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : SvgPicture.asset(
                  icon,
                  width: 24.0,
                  height: 24.0,
                ),
          SizedBox(
            height: isSelected ? 10.0 : 0,
          ),
          isSelected
              ? Container(
                  width: 6.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color: AppCubit.get(context).isDarkMode!
                        ? Colors.white
                        : Colors.black,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100.0,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
