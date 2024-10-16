import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:shop_deal/features/authentication/view_model/login_cubit/login_cubit.dart';
import 'package:shop_deal/features/authentication/view_model/register_cubit/register_cubit.dart';
import 'package:shop_deal/features/authentication/views/widgets/pin_code_field.dart';
import 'package:shop_deal/features/core/widgets/arrow_back_button.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class PhoneNumberVerificationViewBody extends StatelessWidget {
  PhoneNumberVerificationViewBody({super.key, this.isFromLogin});
  final bool? isFromLogin;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is CreateUserSuccessFulState) {
          context.go(AppRouter.rootView);
        } else if (state is RegisterFailureState) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              snackBarType: SnackBarType.error);
        } else if (state is CreateUserFailureState) {
          showSnackBar(
              context: context,
              message: state.errorMessage,
              snackBarType: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 44.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArrowBackButton(),
                const SizedBox(
                  height: 62.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: kIsDarkMode!
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).verification,
                        style: Styles.textStyles30,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        S.of(context).a6Digits,
                        style: Styles.textStyles14.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const SizedBox(
                        height: 57.0,
                      ),
                      Form(
                        key: formKey,
                        child: PinCodeField(
                          controller: pinCodeController,
                        ),
                      ),
                      const SizedBox(
                        height: 65.5,
                      ),
                      state is RegisterLoadingState
                          ? const CustomLoadingWidget()
                          : BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state is LoginSuccessfulState) {
                                  context.go(AppRouter.rootView);
                                }
                              },
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return const CustomLoadingWidget();
                                } else {
                                  return BlocConsumer<UserCubit, UserState>(
                                    listener: (context, state) {
                                      if (state is UpdateUserDataSuccesState) {
                                        GoRouter.of(context).pop();
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state
                                          is VerifyPhoneNumberLoadingState) {
                                        return const CustomLoadingWidget();
                                      } else {
                                        return CustomMaterialButton(
                                          title: S
                                              .of(context)
                                              .Continue
                                              .toUpperCase(),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              isFromLogin == null
                                                  ? sl<UserCubit>()
                                                      .verifyPhoneNumber(
                                                          smsCode:
                                                              pinCodeController
                                                                  .text)
                                                  : isFromLogin == true
                                                      ? LoginCubit.get(context)
                                                          .login(
                                                              smsCode:
                                                                  pinCodeController
                                                                      .text)
                                                      : RegisterCubit.get(
                                                              context)
                                                          .register(
                                                          smsCode:
                                                              pinCodeController
                                                                  .text,
                                                        );
                                            }
                                          },
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
