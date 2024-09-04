import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String? image;
  final String? phoneNumber;
  final String uid;
  final String fcmToken;
  final bool isPhoneNumberVerified;
  const UserModel({
    required this.name,
    required this.email,
    required this.image,
    this.phoneNumber,
    required this.uid,
    required this.fcmToken,
    required this.isPhoneNumberVerified,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) => UserModel(
        name: jsonData["name"],
        email: jsonData["email"],
        image: jsonData["image"] ??
            "https://img.freepik.com/premium-psd/oil-painting-photoshop-mockup_528542-1036.jpg?w=360",
        phoneNumber: jsonData["phoneNumber"] ?? "",
        uid: jsonData["uid"],
        fcmToken: jsonData["fcmToken"],
        isPhoneNumberVerified: jsonData["isPhoneNumberVerified"],
      );

  static Map<String, dynamic> toMap(UserModel user) => {
        "name": user.name,
        "email": user.email,
        "image": user.image ??
            "https://img.freepik.com/premium-psd/oil-painting-photoshop-mockup_528542-1036.jpg?w=360",
        "phoneNumber": user.phoneNumber ?? "",
        "uid": user.uid,
        "fcmToken": user.fcmToken,
        "isPhoneNumberVerified": user.isPhoneNumberVerified,
      };
  @override
  List<Object?> get props => [
        name,
        email,
        image,
        phoneNumber,
        uid,
        fcmToken,
        isPhoneNumberVerified,
      ];
}
