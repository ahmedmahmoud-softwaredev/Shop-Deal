import 'package:equatable/equatable.dart';
import 'package:online_shop/core/utils/assets_constants.dart';
import 'package:online_shop/features/core/view_model/app_cubit/app_cubit.dart';
import 'package:online_shop/generated/l10n.dart';

class PaymentMethodModel extends Equatable {
  final String icon;
  final String title;
  const PaymentMethodModel({
    required this.icon,
    required this.title,
  });
  @override
  List<Object?> get props => [
        icon,
        title,
      ];
}

List<PaymentMethodModel> paymentMethods(context) => [
      PaymentMethodModel(
        icon: AppCubit.get(context).isDarkMode!
            ? DarkModeAssetsConstants.creditCardsIcon
            : AssetsConstants.creditCardIcon,
        title: S.of(context).creditCards,
      ),
      PaymentMethodModel(
        icon: AppCubit.get(context).isDarkMode!
            ? DarkModeAssetsConstants.cashOnDeliveryIcon
            : AssetsConstants.cashOnDeliveryIcon,
        title: S.of(context).cod,
      ),
    ];
