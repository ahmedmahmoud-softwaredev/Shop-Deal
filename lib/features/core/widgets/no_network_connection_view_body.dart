import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_deal/core/global/theme/colors/app_colors.dart';
import 'package:shop_deal/core/utils/assets_constants.dart';
import 'package:shop_deal/core/utils/text_styles.dart';
import 'package:shop_deal/generated/l10n.dart';

class NoNetworkConnectionViewBody extends StatelessWidget {
  const NoNetworkConnectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.noNetworkConnectionIcon,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            S.of(context).noInternetConnection,
            style: Styles.textStyles26.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
