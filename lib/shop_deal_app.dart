import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_deal/core/global/theme/theme_data/dark_model_theme_data/dark_mode_theme_data.dart';
import 'package:shop_deal/core/global/theme/theme_data/light_mode_theme_data/light_mode_theme_data.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:shop_deal/features/authentication/view_model/login_cubit/login_cubit.dart';
import 'package:shop_deal/features/authentication/view_model/register_cubit/register_cubit.dart';
import 'package:shop_deal/features/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:shop_deal/features/checkout/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:shop_deal/features/core/view_model/internet_cubit/internet_cubit.dart';
import 'package:shop_deal/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:shop_deal/generated/l10n.dart';

class ShopDealApp extends StatelessWidget {
  const ShopDealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CartCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AddressCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<CheckoutCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<UserCubit>()..getUserData(),
        ),
        BlocProvider(
          create: (context) => InternetCubit()..checkInternetConnection(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..init(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return AnnotatedRegion(
            value: kIsDarkMode == true
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            child: MaterialApp.router(
              locale: Locale(AppCubit.get(context).currentLanguage!),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.routes,
              theme: AppCubit.get(context).isDarkMode!
                  ? darkModeThemeData()
                  : lightModeThemeData(),
            ),
          );
        },
      ),
    );
  }
}
