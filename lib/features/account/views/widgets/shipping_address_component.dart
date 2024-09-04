import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:online_shop/core/global/theme/colors/app_colors.dart';
import 'package:online_shop/core/utils/text_styles.dart';
import 'package:online_shop/features/account/models/address_model.dart';

class ShippingAddressComponent extends StatelessWidget {
  const ShippingAddressComponent(
      {super.key, required this.address, required this.onPressed});
  final AddressModel address;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.0,
              ),
            ),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            scrollGesturesEnabled: false,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: false,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: false,
            mapToolbarEnabled: false,
            initialCameraPosition: CameraPosition(
              zoom: 18,
              target: LatLng(
                address.lat,
                address.lon,
              ),
            ),
            markers: {
              Marker(
                onTap: () {},
                markerId: MarkerId(
                  address.title,
                ),
                position: LatLng(
                  address.lat,
                  address.lon,
                ),
              ),
            },
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.title,
                    style: Styles.textStyles18,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    address.addressDetails,
                    style: Styles.textStyles14.copyWith(
                      height: 1.7,
                    ),
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onPressed,
              icon: address.isSelected
                  ? const Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                      size: 30.0,
                    )
                  : const Icon(
                      Icons.circle,
                      color: AppColors.greyColor,
                      size: 30.0,
                    ),
            )
          ],
        ),
      ],
    );
  }

  // Widget _buildGoogleMap() => ;
}
