import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/core/helpers/location_helper.dart';
import 'package:online_shop/core/utils/contants.dart';
import 'package:online_shop/features/account/models/address_model.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitialState());
  static AddressCubit get(context) => BlocProvider.of(context);
  List<AddressModel> addresses = [];
  AddressModel? selectedAddress;
  Position? currentPosition;
  void getAddresses() {
    emit(GetAddressesLoadingState());
    try {
      var addressesBox = Hive.box<AddressModel>(kAddressesBox);
      addresses = addressesBox.values.toList();
      for (AddressModel address in addresses) {
        if (address.isSelected == true) {
          selectedAddress = address;
        }
      }
      emit(GetAddressesSuccessState());
    } catch (error) {
      emit(
        GetAddressesFailureState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void addAddress({
    required String addressTitle,
    required String addressDetails,
  }) {
    emit(AddAddressLoadingState());
    var addressesBox = Hive.box<AddressModel>(kAddressesBox);
    AddressModel addressModel = AddressModel(
      title: addressTitle,
      addressDetails: addressDetails,
      lat: currentPosition!.latitude,
      lon: currentPosition!.longitude,
      isSelected: addressesBox.values.isEmpty ? true : false,
    );

    addressesBox.add(addressModel).then((value) {
      emit(AddAddressSuccessState());
    }).catchError((error) {
      emit(AddAddressFailureState(
        errorMessage: error.toString(),
      ));
    });
  }

  void changeSelectedShippingAddress({required int index}) {
    emit(ChangeSelectedAddressLoadingState());
    var addressesBox = Hive.box<AddressModel>(kAddressesBox);
    for (int i = 0; i < addressesBox.values.length; i++) {
      AddressModel addressModel = AddressModel(
        title: addressesBox.values.toList()[i].title,
        addressDetails: addressesBox.values.toList()[i].addressDetails,
        lat: addressesBox.values.toList()[i].lat,
        lon: addressesBox.values.toList()[i].lon,
        isSelected: false,
      );
      addressesBox.putAt(i, addressModel);
    }
    AddressModel newAddressModel = AddressModel(
      title: addressesBox.values.toList()[index].title,
      addressDetails: addressesBox.values.toList()[index].addressDetails,
      lat: addressesBox.values.toList()[index].lat,
      lon: addressesBox.values.toList()[index].lon,
      isSelected: true,
    );
    addressesBox.putAt(index, newAddressModel).then((value) {
      emit(ChangeSelectedAddressSuccessState());
    }).catchError((error) {
      emit(
        ChangeSelectedAddressFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void deleteAddress({required int index}) {
    emit(DeleteAddressLoadingState());
    if (addresses[index].isSelected == true && addresses.length > 1) {
      changeSelectedShippingAddress(index: index == 0 ? 1 : 0);
    }
    var addressesBox = Hive.box<AddressModel>(kAddressesBox);
    addressesBox.deleteAt(index).then((value) {
      emit(DeleteAddressSuccessState());
    }).catchError((error) {
      emit(
        DeleteAddressAddressFailureState(
          errorMessage: error.toString(),
        ),
      );
    });
  }

  void getCurrentLocation() {
    emit(GetCurrentLocationLoadingState());
    LocationHelper.getCurrentLocation().then(
      (position) {
        currentPosition = position;
        emit(GetCurrentLocationSuccessState());
      },
    ).catchError(
      (error) {
        emit(
          GetCurrentLocationFailureState(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }
}
