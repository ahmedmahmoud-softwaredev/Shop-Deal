import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:online_shop/features/account/views/widgets/image_source_option.dart';
import 'package:online_shop/generated/l10n.dart';

class ImageSourceDialog extends StatelessWidget {
  const ImageSourceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageSourceOption(
              title: S.of(context).camera,
              icon: Icons.camera_alt_rounded,
              onPressed: () {
                sl<UserCubit>().pickUserImage(isFromGallery: false);
                GoRouter.of(context).pop();
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.12,
            ),
            ImageSourceOption(
              title: S.of(context).gallery,
              icon: Icons.image,
              onPressed: () {
                sl<UserCubit>().pickUserImage(isFromGallery: true);
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
