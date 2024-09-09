import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  required SnackBarType snackBarType,
}) =>
    showTopSnackBar(
      Overlay.of(context),
      snackBarType == SnackBarType.info
          ? CustomSnackBar.info(
              message: message,
            )
          : snackBarType == SnackBarType.error
              ? CustomSnackBar.error(
                  message: message,
                )
              : CustomSnackBar.success(
                  message: message,
                ),
    );
