import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/custom_text_form_field_component.dart';
import 'package:shop_deal/generated/l10n.dart';

class NewAddressViewBody extends StatelessWidget {
  NewAddressViewBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController addressTitleController = TextEditingController();
  final TextEditingController addressDetailsController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 30.0,
        ),
        child: Column(
          children: [
            CustomTextFormFieldComponent(
              controller: addressTitleController,
              title: S.of(context).addressTitle,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 50.0,
            ),
            CustomTextFormFieldComponent(
              controller: addressDetailsController,
              title: S.of(context).addressDetails,
              maxLines: 2,
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 70.0,
            ),
            sl<AddressCubit>().state == AddAddressLoadingState()
                ? const CustomLoadingWidget()
                : CustomMaterialButton(
                    title: S.of(context).add,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        sl<AddressCubit>().addAddress(
                          addressTitle: addressTitleController.text,
                          addressDetails: addressDetailsController.text,
                        );
                        GoRouter.of(context).pop();
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
