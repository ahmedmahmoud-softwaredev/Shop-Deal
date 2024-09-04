import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop/core/utils/service_locator.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/account/view_model/address_cubit/address_cubit.dart';
import 'package:online_shop/features/core/widgets/custom_loading_widget.dart';
import 'package:online_shop/generated/l10n.dart';

class GoogleMapsViewBody extends StatelessWidget {
  const GoogleMapsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is GetCurrentLocationFailureState) {
          return Center(
            child: Text(
              S.of(context).pleaseAllowTheLocationPermission,
              style: Styles.textStyles20.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else if (state is GetCurrentLocationSuccessState) {
          return GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              zoom: 20,
              target: LatLng(
                sl<AddressCubit>().currentPosition!.latitude,
                sl<AddressCubit>().currentPosition!.longitude,
              ),
            ),
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
