import 'package:equatable/equatable.dart';

class OrderProductModel extends Equatable {
  final String productId;
  final String productImage;
  final int quantity;
  String? size;
  String? color;
  OrderProductModel({
    required this.productId,
    required this.quantity,
    required this.productImage,
    this.size,
    this.color,
  });

  factory OrderProductModel.fromjson(Map<String, dynamic> jsonData) =>
      OrderProductModel(
        productId: jsonData["productId"],
        quantity: jsonData["quantity"],
        size: jsonData["size"],
        color: jsonData["color"],
        productImage: jsonData["productImage"],
      );
  static Map<String, dynamic> toJson(
          {required OrderProductModel orderProductModel}) =>
      {
        "productId": orderProductModel.productId,
        "quantity": orderProductModel.quantity,
        "size": orderProductModel.size,
        "color": orderProductModel.color,
        "productImage": orderProductModel.productImage,
      };

  @override
  List<Object?> get props => [
        productId,
        size,
        color,
      ];
}
