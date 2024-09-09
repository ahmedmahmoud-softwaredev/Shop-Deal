import 'package:shop_deal/core/utils/contants.dart';

String fireBaseAuthErrorHandler({required String errorCode}) {
  switch (errorCode) {
    case "invalid-credential":
      return kCurrentLanguage == "ar"
          ? "بريدك الإلكتروني أو كلمة المرور غير صحيح."
          : "Your email or password are incorrect.";
    case "invalid-email":
      return kCurrentLanguage == "ar"
          ? "بريدك الإلكتروني غير صالح، يرجى كتابة البريد الإلكتروني كالمثال التالي: xxxxxxxxxx@xxxxxx.xxx"
          : "Your email is invalid please type email as next example: xxxxxxxxx@xxxxx.xxx";
    case "user-disabled":
      return kCurrentLanguage == "ar"
          ? "لقد تم تعطيل حسابك."
          : "Your account has been disabled.";
    case "network-request-failed":
      return kCurrentLanguage == "ar"
          ? "هناك مشكلة في الانترنت الخاص بك."
          : "There is a problem with your network.";
    default:
      return kCurrentLanguage == "ar"
          ? "هناك شيء خاطئ حدث."
          : "There is something wrong happened.";
  }
}
