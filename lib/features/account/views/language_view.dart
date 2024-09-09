import 'package:flutter/material.dart';
import 'package:shop_deal/features/account/views/widgets/language_view_body.dart';
import 'package:shop_deal/features/core/widgets/custom_appbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: S.of(context).language),
      body: const LanguageViewBody(),
    );
  }
}
