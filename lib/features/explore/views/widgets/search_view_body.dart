import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_deal/features/core/widgets/arrow_back_button.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/explore/view_model/search_cubit/search_cubit.dart';
import 'package:shop_deal/features/explore/views/widgets/product_widget.dart';
import 'package:shop_deal/features/explore/views/widgets/search_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const ArrowBackButton(),
                Expanded(
                  child: SearchField(
                    onChanged: (text) {
                      SearchCubit.get(context).search(searchText: text);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: state is SearchLoadingState
                  ? const CustomLoadingWidget()
                  : state is SearchFailureState
                      ? const CustomErrorWidget()
                      : state is SearchSuccessState
                          ? GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 22.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.45,
                                crossAxisSpacing: 15.0,
                                mainAxisSpacing: 16.0,
                              ),
                              itemBuilder: (context, index) => ProductWidget(
                                product: state.searchList[index],
                              ),
                              itemCount: state.searchList.length,
                            )
                          : const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
