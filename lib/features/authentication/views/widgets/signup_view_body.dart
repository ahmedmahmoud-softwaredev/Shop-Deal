import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/features/authentication/view_model/register_cubit/register_cubit.dart';
import 'package:shop_deal/features/authentication/views/widgets/signup_component.dart';
import 'package:shop_deal/features/core/widgets/arrow_back_button.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is PhoneAuthSuccessState) {
          GoRouter.of(context)
              .push(AppRouter.phoneNumberVerificationView, extra: false);
        } else if (state is PhoneAuthFailureState) {
          showSnackBar(
            context: context,
            message: state.errorMessage,
            snackBarType: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is PhoneAuthLoadingState) {
          return const CustomLoadingWidget();
        } else {
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
                  SignupComponent(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
