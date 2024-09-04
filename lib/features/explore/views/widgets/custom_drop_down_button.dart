import 'package:flutter/material.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/app_constants.dart';
import 'package:online_shop/core/utils/functions.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/explore/view_model/item_details_cubit/item_details_cubit.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton(
      {super.key, required this.title, required this.values});
  final String title;
  final List values;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderGreyColor,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            widget.title,
            style: Styles.textStyles14,
          ),
          Expanded(
            child: DropdownButton(
              underline: const SizedBox(),
              icon: const SizedBox(),
              padding: EdgeInsets.zero,
              value: widget.values[index],
              alignment:
                  isArabic() ? Alignment.centerLeft : Alignment.centerRight,
              isExpanded: true,
              items: List.generate(
                widget.values.length,
                (index) => DropdownMenuItem(
                    alignment: isArabic()
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    value: widget.values[index],
                    child: Text(
                      widget.values[index],
                      style: Styles.textStyles14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              onChanged: (value) {
                setState(() {
                  index = widget.values.indexOf(value!);
                  widget.title == AppConstants.size
                      ? ItemDetailsCubit.get(context).changeSelectedSize(
                          newSizeIndex: index,
                        )
                      : ItemDetailsCubit.get(context).changeSelectedColor(
                          newColorIndex: index,
                        );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
