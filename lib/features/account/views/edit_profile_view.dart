import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/account/views/widgets/edit_profile_view_body.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? const Scaffold(
                body: EditProfileViewBody(),
              )
            : state is InternetNotConnectedState
                ? const NoNetworkConnectionView()
                : const CustomLoadingView();
      },
    );
  }
}
