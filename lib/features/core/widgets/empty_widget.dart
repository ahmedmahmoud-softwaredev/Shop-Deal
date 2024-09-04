import 'package:flutter/material.dart';
import 'package:online_shop/core/utils/text_styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Styles.textStyles20.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
