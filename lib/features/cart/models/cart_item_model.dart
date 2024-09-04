import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:online_shop/features/explore/models/product_model.dart';
part "cart_item_model.g.dart";

@HiveType(typeId: 0)
class CartItemModel extends Equatable {
  @HiveField(0)
  final ProductModel product;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  String? size;
  @HiveField(3)
  String? color;
  CartItemModel({
    required this.product,
    required this.quantity,
    this.size,
    this.color,
  });

  CartItemModel copyWith({
    ProductModel? product,
    int? quantity,
    String? size,
    String? color,
  }) =>
      CartItemModel(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        size: size ?? this.size,
        color: color ?? this.color,
      );
  @override
  List<Object?> get props => [
        product,
        quantity,
        size,
        color,
      ];
}
