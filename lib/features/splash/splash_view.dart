import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/helpers/shared_preferences_helper.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/features/splash/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      goNext,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }

  void goNext() {
    GoRouter.of(context).pushReplacement(
      SharedPreferencesHelper.isLoggedIn
          ? AppRouter.rootView
          : AppRouter.logInView,
    );
  }
}
