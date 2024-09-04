import 'package:flutter/material.dart';

class TrackingCircleWidget extends StatelessWidget {
  const TrackingCircleWidget({
    super.key,
    required this.circleColor,
    required this.borderColor,
  });
  final Color circleColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.0,
      height: 35.0,
      padding: const EdgeInsets.all(
        7.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            100.0,
          ),
        ),
      ),
      child: Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: circleColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              100.0,
            ),
          ),
        ),
      ),
    );
  }
}
