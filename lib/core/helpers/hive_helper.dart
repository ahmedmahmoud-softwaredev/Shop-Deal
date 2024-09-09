import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_deal/core/utils/contants.dart';
import 'package:shop_deal/core/utils/enums.dart';
import 'package:shop_deal/features/account/models/address_model.dart';
import 'package:shop_deal/features/account/models/notification_model.dart';
import 'package:shop_deal/features/cart/models/cart_item_model.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/models/review_model.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
    await HiveHelper.registerHiveAdapters();
    await HiveHelper.openHiveBoxes();
  }

  static Future<void> openHiveBoxes() async {
    Future.wait(
      [
        Hive.openBox<CartItemModel>(kCartItemsBox),
        Hive.openBox<ProductModel>(kWishListBox),
        Hive.openBox<AddressModel>(kAddressesBox),
        Hive.openBox<NotificationModel>(kNotificationsBox),
      ],
    );
  }

  static Future<void> registerHiveAdapters() async {
    Hive.registerAdapter(CartItemModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ReviewModelAdapter());
    Hive.registerAdapter(CardTypeAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    Hive.registerAdapter(NotificationModelAdapter());
  }
}
