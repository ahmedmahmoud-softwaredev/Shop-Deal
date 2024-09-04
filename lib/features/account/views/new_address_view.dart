import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:online_shop/features/account/views/widgets/new_address_view_body.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/generated/l10n.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddressCubit>(),
      child: Scaffold(
        appBar: customAppBar(title: S.of(context).newShippingAddress),
        body: NewAddressViewBody(),
      ),
    );
  }
}
