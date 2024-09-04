import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:online_shop/features/core/views/custom_loading_view.dart';
import 'package:online_shop/features/core/views/no_network_connection_view.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
import 'package:online_shop/features/explore/view_model/write_review_cubit/write_review_cubit.dart';
import 'package:online_shop/features/explore/views/widgets/write_review_view_body.dart';
import 'package:online_shop/generated/l10n.dart';

class WriteReviewView extends StatelessWidget {
  const WriteReviewView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetState>(
      builder: (context, state) {
        return state is InternetConnectedState
            ? BlocProvider(
                create: (context) => WriteReviewCubit(),
                child: Scaffold(
                  appBar: customAppBar(title: S.of(context).writeYourReview),
                  body: WriteReviewViewBody(
                    product: product,
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
