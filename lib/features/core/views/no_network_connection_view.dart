import 'package:flutter/material.dart';
import 'package:shop_deal/features/core/widgets/no_network_connection_view_body.dart';

class NoNetworkConnectionView extends StatelessWidget {
  const NoNetworkConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoNetworkConnectionViewBody(),
    );
  }
}
