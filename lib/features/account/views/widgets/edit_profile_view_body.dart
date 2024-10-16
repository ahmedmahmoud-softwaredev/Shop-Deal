import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/app_router.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/core/utils/functions.dart';
import 'package:shop_deal/core/utils/service_locator.dart';
import 'package:shop_deal/features/account/view_model/user_cubit/user_cubit.dart';
import 'package:shop_deal/features/account/views/widgets/image_source_dialog.dart';
import 'package:shop_deal/features/core/widgets/arrow_back_button.dart';
import 'package:shop_deal/features/core/widgets/custom_error_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_loading_widget.dart';
import 'package:shop_deal/features/core/widgets/custom_material_button.dart';
import 'package:shop_deal/features/core/widgets/custom_text_form_field_component.dart';
import 'package:shop_deal/features/core/widgets/show_snackbar.dart';
import 'package:shop_deal/generated/l10n.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = currentUser!.name;
    emailController.text = currentUser!.email;
    phoneController.text = currentUser!.phoneNumber!;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment:
                    isArabic() ? Alignment.centerRight : Alignment.centerLeft,
                child: const ArrowBackButton(),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: 160.0,
                height: 160.0,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          100.0,
                        ),
                      ),
                      child: BlocConsumer<UserCubit, UserState>(
                        listener: (context, state) {
                          if (state is PhoneAuthFailureState) {
                            showSnackBar(
                              context: context,
                              message: state.errorMessage,
                              snackBarType: SnackBarType.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is UploadProfilePicLoadingState ||
                              state is GetUserLoadingState) {
                            return const SizedBox(
                              width: 163.0,
                              height: 163.0,
                              child: CustomLoadingWidget(),
                            );
                          } else if (state is UploadProfilePicFailureState) {
                            return const SizedBox(
                              width: 160.0,
                              height: 160.0,
                              child: CustomErrorWidget(),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.all(
                                3.0,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    100.0,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: currentUser!.image!,
                                  placeholder: (context, url) =>
                                      const CustomLoadingWidget(),
                                  errorWidget: (context, url, error) =>
                                      const CustomErrorWidget(),
                                  width: 160.0,
                                  height: 160.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.7, 1),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const ImageSourceDialog(),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100.0,
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 22.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              CustomTextFormFieldComponent(
                controller: nameController,
                title: S.of(context).name,
                keyboardType: TextInputType.name,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormFieldComponent(
                controller: emailController,
                title: S.of(context).email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextFormFieldComponent(
                controller: phoneController,
                title: S.of(context).phoneNumber,
                keyboardType: TextInputType.phone,
                isReadOnly: currentUser!.isPhoneNumberVerified ? true : false,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 80.0,
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UpdateUserDataSuccesState) {
                    sl<UserCubit>().getUserData();
                  } else if (state is PhoneAuthSuccessState) {
                    GoRouter.of(context)
                        .push(AppRouter.phoneNumberVerificationView);
                  }
                },
                builder: (context, state) {
                  if (state is UpdateUserDataLoadingState ||
                      state is PhoneAuthLoadingState) {
                    return const CustomLoadingWidget();
                  } else if (state is UpdateUserDataFailureState) {
                    return const CustomErrorWidget();
                  } else {
                    return CustomMaterialButton(
                      title: S.of(context).update.toUpperCase(),
                      onPressed: () {
                        sl<UserCubit>().updateUserData(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                        );
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
