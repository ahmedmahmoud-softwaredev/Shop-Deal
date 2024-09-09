import 'package:shop_deal/features/authentication/models/user_model.dart';

//global variables
UserModel? currentUser;
String? kCurrentLanguage;
bool? kIsDarkMode;
String? kFCMToken;

//Shared Pref Keys
const String isLoggedInKey = "isLoggedIn";
const String languageKey = "language";
const String themeModeKey = "themeMode";

//Hive Boxes
const String kCartItemsBox = "cartItemsBox";
const String kWishListBox = "WishListBox";
const String kAddressesBox = "addressesBox";
const String kNotificationsBox = "notificationsBox";

//Fire Store Collections Keys
const String usersCollection = "Users";
const String productsCollection = "Products";
const String kOrdersCollection = "Orders";
const String kBannersCollection = "Banners";

//Paymob payment gateway
const String paymobApiKey =
    "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaU1UWTJORFl6TkRBd05pNDJNek0zTVRraUxDSndjbTltYVd4bFgzQnJJam8xTWpNMk1qY3NJbU5zWVhOeklqb2lUV1Z5WTJoaGJuUWlmUS5IT2c5d1BMTTZIaHNLX3BUOE43cTc4U3FKSnJjN1pBeWpIdjR1MXBfSF82X2NxdzVSYTdQUUxJX1dGdXM3MFF3Z1cwZ1JTc3IzTWlSX2dVN2pDQ2c5QQ==";
String visaIFrameUrl({required String orderToken}) =>
    "https://accept.paymob.com/api/acceptance/iframes/679384?payment_token=$orderToken";
