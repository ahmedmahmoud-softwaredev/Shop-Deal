import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/core/utils/app_constants.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/views/custom_loading_view.dart';
import 'package:shop_deal/features/core/views/no_network_connection_view.dart';
import 'package:shop_deal/features/explore/view_model/category_cubit/category_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/category_view_body.dart';
import 'package:shop_deal/generated/l10n.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocProvider(
                create: (context) => CategoryCubit()
                  ..getCategoryProducts(
                    category: index == 0
                        ? AppConstants.men
                        : index == 1
                            ? AppConstants.women
                            : index == 2
                                ? AppConstants.devices
                                : index == 3
                                    ? AppConstants.gadgets
                                    : AppConstants.gaming,
                  ),
                child: Scaffold(
                  body: CategoryViewBody(
                    category: index == 0
                        ? S.of(context).men
                        : index == 1
                            ? S.of(context).women
                            : index == 2
                                ? S.of(context).devices
                                : index == 3
                                    ? S.of(context).gadgets
                                    : S.of(context).gaming,
                  ),
                ),
              )
            : state is InternetNotConnectedState
                ? const NoNetworkConnectionView()
                : const CustomLoadingView();
      },
    );
  }
}
