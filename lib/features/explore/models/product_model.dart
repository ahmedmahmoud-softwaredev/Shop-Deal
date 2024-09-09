import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/features/explore/models/review_model.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends Equatable {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String details;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final String category;
  @HiveField(5)
  List<ReviewModel>? reviews;
  @HiveField(6)
  final bool isInStock;
  @HiveField(7)
  final List? sizes;
  @HiveField(8)
  final List? colors;
  @HiveField(9)
  final String productId;
  @HiveField(10)
  final bool? isBestSelling;
  @HiveField(11)
  final bool? isRecommended;

  ProductModel({
    required this.image,
    required this.title,
    required this.details,
    required this.price,
    required this.isInStock,
    required this.category,
    required this.productId,
    this.isBestSelling,
    this.isRecommended,
    this.reviews,
    this.sizes,
    this.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) => ProductModel(
        image: jsonData["image"],
        title: jsonData["title"],
        details: jsonData["details"],
        price: jsonData["price"],
        isInStock: jsonData["isInStock"],
        category: jsonData["category"],
        productId: jsonData["productId"],
        isBestSelling: jsonData["isBestSelling"],
        isRecommended: jsonData["isRecommended"],
        reviews: jsonData["reviews"] != null
            ? List.generate(
                List.from(jsonData["reviews"]).length,
                (index) => ReviewModel.fromJSon(
                  jsonData["reviews"][index],
                ),
              )
            : [],
        sizes: jsonData["sizes"],
        colors: jsonData["colors"],
      );

  static Map<String, dynamic> toMap(ProductModel product) => {
        "image": product.image,
        "title": product.title,
        "details": product.details,
        "price": product.price,
        "isInStock": product.isInStock,
        "category": product.category,
        "productId": product.productId,
        "reviews": product.reviews != null
            ? List<Map<String, dynamic>>.generate(
                product.reviews!.length,
                (index) => ReviewModel.toMap(
                  product.reviews![index],
                ),
              )
            : null,
        "sizes": product.sizes,
        "colors": product.colors,
        "isBestSelling": product.isBestSelling,
        "isRecommended": product.isRecommended,
      };

  @override
  List<Object?> get props => [
        image,
        title,
        details,
        price,
        reviews,
        isInStock,
        sizes,
        colors,
        category,
        productId,
        isBestSelling,
        isRecommended,
      ];
}
