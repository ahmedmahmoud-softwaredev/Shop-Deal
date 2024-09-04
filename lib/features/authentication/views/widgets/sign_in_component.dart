import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/app_router.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/authentication/view_model/login_cubit/login_cubit.dart';
import 'package:online_shop/features/core/widgets/custom_material_button.dart';
import 'package:online_shop/features/core/widgets/custom_text_form_field_component.dart';
import 'package:online_shop/generated/l10n.dart';

class SignInComponent extends StatelessWidget {
  SignInComponent({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4.0,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).welcome,
                  style: Styles.textStyles30,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouter.signUpView,
                    );
                  },
                  child: Text(
                    S.of(context).signup.toUpperCase(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              S.of(context).signInToContinue,
              style: Styles.textStyles14.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            CustomTextFormFieldComponent(
              title: S.of(context).phoneNumber,
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              onChanged: (newString) {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomMaterialButton(
              title: S.of(context).signin.toUpperCase(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  LoginCubit.get(context).phoneAuth(
                    phoneNumber: phoneNumberController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
