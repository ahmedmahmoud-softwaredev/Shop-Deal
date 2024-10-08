import 'package:get_it/get_it.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<CheckoutCubit>(() => CheckoutCubit());
  sl.registerLazySingleton<AddressCubit>(() => AddressCubit());
  sl.registerLazySingleton<CartCubit>(() => CartCubit());
  sl.registerLazySingleton<UserCubit>(() => UserCubit());
}
