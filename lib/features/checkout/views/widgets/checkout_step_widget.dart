import 'package:flutter/material.dart';
import 'package:online_shop/features/account/views/widgets/tracking_circle_widget.dart';

class CheckoutStepWidget extends StatelessWidget {
  const CheckoutStepWidget({
    super.key,
    required this.circleColor,
    required this.borderColor,
    required this.lineColor,
  });
  final Color circleColor;
  final Color borderColor;
  final Color lineColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         TrackingCircleWidget(
          circleColor: circleColor,
          borderColor: borderColor,
        ),
        Expanded(
          child: Container(
            height: 2,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
