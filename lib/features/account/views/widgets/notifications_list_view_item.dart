import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/account/models/notification_model.dart';
import 'package:shop_deal/features/core/widgets/custom_cached_network_image.dart';

class NotificationsListViewItem extends StatelessWidget {
  const NotificationsListViewItem({super.key, required this.notification});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: kIsDarkMode! ? Colors.white.withOpacity(0.08) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            4.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: Styles.textStyles18,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  notification.content,
                  style: Styles.textStyles12,
                ),
              ],
            ),
          ),
          SizedBox(
            width: notification.image != null ? 5.0 : 0.0,
          ),
          notification.image != null
              ? ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  child: CustomCachedNetworkImage(
                    imageUrl: notification.image!,
                    width: 65.0,
                    height: 65.0,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
