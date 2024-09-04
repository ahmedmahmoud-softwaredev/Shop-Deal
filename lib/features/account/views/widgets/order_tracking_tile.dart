import 'package:flutter/material.dart';
import 'package:online_shop/features/account/views/widgets/tracking_circle_widget.dart';

class OrderTrackingTile extends StatelessWidget {
  const OrderTrackingTile({
    super.key,
    this.isEnd = false,
    required this.circleColor,
    required this.borderColor,
    required this.lineColor,
  });
  final bool isEnd;
  final Color circleColor;
  final Color borderColor;
  final Color lineColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TrackingCircleWidget(
          circleColor: circleColor,
          borderColor: borderColor,
        ),
        isEnd
            ? const SizedBox()
            : Container(
                height: 100.0,
                width: 2.0,
                color: lineColor,
              ),
      ],
    );
  }
}
