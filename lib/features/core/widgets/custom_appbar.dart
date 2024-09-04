import 'package:flutter/material.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/core/widgets/arrow_back_button.dart';

AppBar customAppBar(
        {required String title,
        List<Widget> actions = const [],
        VoidCallback? onPressed}) =>
    AppBar(
      toolbarHeight: 82.0,
      leading: ArrowBackButton(
        onPressed: onPressed,
      ),
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        title,
        style: Styles.textStyles20,
      ),
      actions: actions,
    );