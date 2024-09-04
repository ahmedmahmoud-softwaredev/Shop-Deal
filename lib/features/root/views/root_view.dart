import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/account/views/account_view.dart';
import 'package:online_shop/features/cart/views/cart_view.dart';
import 'package:online_shop/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:online_shop/features/core/views/no_network_connection_view.dart';
import 'package:online_shop/features/explore/views/explore_view.dart';
import 'package:online_shop/features/root/view_model/root_cubit/root_cubit.dart';
import 'package:online_shop/features/root/views/widgets/bottom_nav_bar.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocProvider(
                create: (context) => RootCubit(),
                child: BlocConsumer<RootCubit, RootState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: RootCubit.get(context).selectedScreen == 0
                                ? const ExploreView()
                                : RootCubit.get(context).selectedScreen == 1
                                    ? const CartView()
                                    : const AccountView(),
                          ),
                          const BottomNavBar(),
                        ],
                      ),
                    );
                  },
                ),
              )
            : const NoNetworkConnectionView();
      },
    );
  }
}
