import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'address_model.g.dart';

@HiveType(typeId: 5)
class AddressModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String addressDetails;
  @HiveField(2)
  bool isSelected;
  @HiveField(3)
  double lat;
  @HiveField(4)
  double lon;
  AddressModel({
    required this.title,
    required this.addressDetails,
    required this.lat,
    required this.lon,
    this.isSelected = false,
  });

  factory AddressModel.fromJson(Map<String, dynamic> jsonData) => AddressModel(
        title: jsonData["addressTitle"],
        addressDetails: jsonData["addressDetails"],
        lat: jsonData["lat"],
        lon: jsonData["lon"],
      );
  static Map<String, dynamic> toJson(AddressModel addressModel) => {
        "addressTitle": addressModel.title,
        "addressDetails": addressModel.addressDetails,
        "lat": addressModel.lat,
        "lon": addressModel.lon,
      };

  @override
  List<Object?> get props => [
        title,
        addressDetails,
        lat,
        lon,
        isSelected,
      ];
}
