import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/account/view_model/wishlist_cubit/wishlist_cubit.dart';
import 'package:online_shop/features/account/views/widgets/wishlist_view_body.dart';
import 'package:online_shop/features/core/widgets/custom_appbar.dart';
import 'package:online_shop/generated/l10n.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: customAppBar(
          title: S.of(context).wishlist,
        ),
        body: const WishlistViewBody(),
      ),
    );
  }
}
