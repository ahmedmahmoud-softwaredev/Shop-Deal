import 'package:dio/dio.dart';
import 'package:shop_deal/core/utils/api_constants.dart';
import 'package:shop_deal/core/utils/contants.dart';

class PaymobHelper {
  static final Dio dio = Dio();

  static Future<String> paymobPay({
    required String totalPrice,
  }) async {
    String authenticationToken = await authenticationRequest();
    int orderId = await orderRegistrationRequest(
      authToken: authenticationToken,
      totalPrice: totalPrice,
    );
    String orderToken = await paymentKeyRequest(
      id: orderId,
      authToken: authenticationToken,
      totalPrice: totalPrice,
    );
    return orderToken;
  }

  static Future<String> authenticationRequest() async {
    try {
      Response response = await dio.post(
        ApiConstants.authenticationRequestApi,
        data: {
          "api_key": paymobApiKey,
        },
      );
      return response.data["token"];
    } catch (error) {
      rethrow;
    }
  }

  static Future<int> orderRegistrationRequest({
    required String authToken,
    required String totalPrice,
  }) async {
    try {
      Map<String, dynamic> body = {
        "auth_token": authToken,
        "delivery_needed": "true",
        "amount_cents": totalPrice,
        "currency": "EGP",
        "items": []
      };
      Response response = await dio.post(
        ApiConstants.orderRegistrationRequestApi,
        data: body,
      );
      return response.data["id"];
    } catch (error) {
      rethrow;
    }
  }

  static Future<String> paymentKeyRequest({
    required int id,
    required String authToken,
    required String totalPrice,
  }) async {
    try {
      Map<String, dynamic> body = {
        "auth_token": authToken,
        "amount_cents": totalPrice,
        "expiration": 3600,
        "order_id": id.toString(),
        "currency": "EGP",
        "integration_id": 2822732,
        "billing_data": {
          "apartment": "NA",
          "email": "NA",
          "floor": "NA",
          "first_name": "NA",
          "street": "NA",
          "building": "NA",
          "phone_number": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "NA",
          "state": "NA"
        }
      };
      Response response = await dio.post(
        ApiConstants.paymentKeyRequestApi,
        data: body,
      );
      return response.data["token"];
    } catch (error) {
      rethrow;
    }
  }
}
