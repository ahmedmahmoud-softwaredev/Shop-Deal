import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:online_shop/features/cart/views/widgets/cart_list_view_item.dart';
import 'package:online_shop/features/core/widgets/empty_widget.dart';
import 'package:online_shop/generated/l10n.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return CartCubit.get(context).cartItems.isNotEmpty
            ? SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 30.0,
                        ),
                        itemBuilder: (context, index) => Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) {
                                  CartCubit.get(context).addToWishList(
                                      item: CartCubit.get(context)
                                          .cartItems[index]
                                          .product);
                                },
                                backgroundColor: AppColors.orangeColor,
                                foregroundColor: Colors.white,
                                icon: Icons.star,
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) {
                                  CartCubit.get(context)
                                      .deleteFromCart(index: index);
                                },
                                backgroundColor: AppColors.redColor,
                                foregroundColor: Colors.white,
                                icon: Icons.delete_outline_rounded,
                              ),
                            ],
                          ),
                          child: CartListViewItem(
                            cartItem: CartCubit.get(context).cartItems[index],
                            index: index,
                            startAnimation: startAnimation,
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16.0,
                        ),
                        itemCount: CartCubit.get(context).cartItems.length,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).total,
                                  style: Styles.textStyles16.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.5,
                                ),
                                const Expanded(
                                  child: Text(
                                    "-----------------------------------------------------------------------------------------------------------",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppColors.borderGreyColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.5,
                                ),
                                Text(
                                  "${S.of(context).egp} ${double.parse(CartCubit.get(context).totalPrice.toStringAsFixed(2))}",
                                  style: Styles.textStyles18,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Divider(
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : EmptyWidget(
                text: S.of(context).yourCartLooksEmpty,
              );
      },
    );
  }
}
