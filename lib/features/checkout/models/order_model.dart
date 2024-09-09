import 'package:equatable/equatable.dart';
import 'package:shop_deal/features/account/models/address_model.dart';
import 'package:shop_deal/features/checkout/models/order_product_model.dart';

class OrderModel extends Equatable {
  final String orderBuyerId;
  final List<OrderProductModel> order;
  final String orderDate;
  final AddressModel address;
  final String paymentMethod;
  final String orderTotalPrice;
  final String orderId;
  final String orderStatus;
  const OrderModel({
    required this.orderBuyerId,
    required this.order,
    required this.orderDate,
    required this.address,
    required this.paymentMethod,
    required this.orderTotalPrice,
    required this.orderId,
    required this.orderStatus,
  });

  factory OrderModel.fromjson(Map<String, dynamic> jsonData) => OrderModel(
        orderBuyerId: jsonData["orderBuyerId"],
        order: List.generate(
          jsonData["order"].length,
          (index) => OrderProductModel.fromjson(
            jsonData["order"][index],
          ),
        ),
        orderDate: jsonData["orderDate"],
        address: AddressModel.fromJson(jsonData["address"]),
        paymentMethod: jsonData["paymentMethod"],
        orderTotalPrice: jsonData["orderTotalPrice"],
        orderId: jsonData["orderId"],
        orderStatus: jsonData["orderStatus"],
      );

  static Map<String, dynamic> toJson(OrderModel orderModel) => {
        "orderBuyerId": orderModel.orderBuyerId,
        "order": List.generate(
          orderModel.order.length,
          (index) => OrderProductModel.toJson(
            orderProductModel: orderModel.order[index],
          ),
        ),
        "orderDate": orderModel.orderDate,
        "address": AddressModel.toJson(orderModel.address),
        "paymentMethod": orderModel.paymentMethod,
        "orderTotalPrice": orderModel.orderTotalPrice,
        "orderId": orderModel.orderId,
        "orderStatus": orderModel.orderStatus,
      };

  OrderModel copyWith({
    String? orderBuyerId,
    List<OrderProductModel>? order,
    String? orderDate,
    AddressModel? address,
    String? paymentMethod,
    String? orderTotalPrice,
    String? orderId,
    String? orderStatus,
  }) =>
      OrderModel(
        orderBuyerId: orderBuyerId ?? this.orderBuyerId,
        order: order ?? this.order,
        orderDate: orderDate ?? this.orderDate,
        address: address ?? this.address,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        orderTotalPrice: orderTotalPrice ?? this.orderTotalPrice,
        orderId: orderId ?? this.orderId,
        orderStatus: orderStatus ?? this.orderStatus,
      );

  @override
  List<Object?> get props => [
        orderBuyerId,
        order,
        orderDate,
        address,
        paymentMethod,
        orderTotalPrice,
        orderId,
        orderStatus,
      ];
}
