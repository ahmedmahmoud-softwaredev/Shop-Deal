import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/assets_constants.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/authentication/view_model/login_cubit/login_cubit.dart';
import 'package:shop_deal/features/authentication/views/widgets/sign_in_component.dart';
import 'package:shop_deal/features/authentication/views/widgets/social_media_button.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginWithGoogleSuccessfulState ||
            state is LoginWithFacebookSuccessfulState) {
          GoRouter.of(context).pushReplacement(AppRouter.rootView);
        } else if (state is PhoneAuthSuccessState) {
          GoRouter.of(context)
              .push(AppRouter.phoneNumberVerificationView, extra: true);
        } else if (state is PhoneAuthFailureState) {
          showSnackBar(
            context: context,
            message: state.errorMessage,
            snackBarType: SnackBarType.error,
          );
        } else if (state is LoginWithGoogleFailureState) {
          showSnackBar(
            context: context,
            message: state.errorMessage,
            snackBarType: SnackBarType.error,
          );
        } else if (state is LoginWithFacebookFailureState) {
          showSnackBar(
            context: context,
            message: state.errorMessage,
            snackBarType: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is PhoneAuthLoadingState ||
            state is LoginWithGoogleLoadingState ||
            state is LoginWithFacebookLoadingState) {
          return const CustomLoadingWidget();
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInComponent(),
                    const SizedBox(
                      height: 28.0,
                    ),
                    Text(
                      "- ${S.of(context).or.toUpperCase()} -",
                      style: Styles.textStyles18.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 43.0,
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        LoginCubit.get(context).loginWithFacebook();
                      },
                      text: S.of(context).signInWithFacebook,
                      icon: AssetsConstants.facebookIcon,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SocialMediaButton(
                      onPressed: () {
                        LoginCubit.get(context).loginWithGoogle();
                      },
                      text: S.of(context).signInWithGoogle,
                      icon: AssetsConstants.googleIcon,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
