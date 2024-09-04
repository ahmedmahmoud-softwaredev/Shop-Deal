import 'package:flutter/material.dart';
import 'package:online_shop/features/explore/views/widgets/custom_drop_down_button.dart';
import 'package:online_shop/generated/l10n.dart';

class ItemSizesColoursWidget extends StatelessWidget {
  const ItemSizesColoursWidget({super.key, this.itemSizes, this.itemColors});
  final List? itemSizes;
  final List? itemColors;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        itemSizes != null
            ? Expanded(
                child: CustomDropDownButton(
                  title: S.of(context).size,
                  values: itemSizes ?? [],
                ),
              )
            : const Spacer(),
        const SizedBox(
          width: 23.0,
        ),
        itemColors != null
            ? Expanded(
                child: CustomDropDownButton(
                  title: S.of(context).colour,
                  values: itemColors ?? [],
                ),
              )
            : const Spacer(),
      ],
    );
  }
}
