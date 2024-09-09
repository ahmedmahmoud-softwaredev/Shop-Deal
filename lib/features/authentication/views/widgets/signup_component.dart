import 'package:flutter/material.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/features/authentication/view_model/register_cubit/register_cubit.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/custom_text_form_field_component.dart';
import 'package:shop_deal/generated/l10n.dart';

class SignupComponent extends StatelessWidget {
  SignupComponent({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
            Text(
              S.of(context).signup,
              style: Styles.textStyles30,
            ),
            const SizedBox(
              height: 50.0,
            ),
            CustomTextFormFieldComponent(
              controller: nameController,
              title: S.of(context).name,
              keyboardType: TextInputType.name,
              onChanged: (newString) {},
            ),
            const SizedBox(
              height: 40.0,
            ),
            CustomTextFormFieldComponent(
              controller: emailController,
              title: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
              isEmail: true,
              onChanged: (newString) {},
            ),
            const SizedBox(
              height: 40.0,
            ),
            CustomTextFormFieldComponent(
              controller: phoneNumberController,
              title: S.of(context).phoneNumber,
              keyboardType: TextInputType.phone,
              onChanged: (newString) {},
            ),
            const SizedBox(
              height: 60.0,
            ),
            CustomMaterialButton(
              title: S.of(context).signup.toUpperCase(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  RegisterCubit.get(context).phoneAuth(
                    phoneNumber: phoneNumberController.text,
                    name: nameController.text,
                    email: emailController.text,
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
