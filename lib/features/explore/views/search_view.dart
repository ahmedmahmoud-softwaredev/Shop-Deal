import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/explore/view_model/search_cubit/search_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const SafeArea(
        child: Scaffold(
          body: SearchViewBody(),
        ),
      ),
    );
  }
}
