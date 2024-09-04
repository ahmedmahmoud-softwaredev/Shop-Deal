import 'package:hive_flutter/hive_flutter.dart';

part 'enums.g.dart';

@HiveType(typeId: 4)
enum CardType {
  @HiveField(0)
  masterCard,
  @HiveField(1)
  visa,
}

enum OrderStatus {
  orderSigned,
  orderProcessed,
  shipped,
  outForDelivery,
  delivered,
}

enum SnackBarType {
  info,
  error,
  success,
}
