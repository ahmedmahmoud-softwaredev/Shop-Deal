import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/features/explore/view_model/explore_cubit/explore_cubit.dart';
import 'package:online_shop/features/explore/views/widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit()..getProducts(),
      child: const SafeArea(
        child: Scaffold(
          body: ExploreViewBody(),
        ),
      ),
    );
  }
}
