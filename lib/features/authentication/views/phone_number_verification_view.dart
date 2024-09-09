import 'package:flutter/material.dart';
import 'package:shop_deal/features/authentication/views/widgets/phone_number_view_body.dart';

class PhoneNumberVerificationView extends StatelessWidget {
  const PhoneNumberVerificationView({super.key, this.isFromLogin});
  final bool? isFromLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhoneNumberVerificationViewBody(
        isFromLogin: isFromLogin,
      ),
    );
  }
}
