// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Men`
  String get men {
    return Intl.message(
      'Men',
      name: 'men',
      desc: '',
      args: [],
    );
  }

  /// `Women`
  String get women {
    return Intl.message(
      'Women',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get devices {
    return Intl.message(
      'Devices',
      name: 'devices',
      desc: '',
      args: [],
    );
  }

  /// `Gadgets`
  String get gadgets {
    return Intl.message(
      'Gadgets',
      name: 'gadgets',
      desc: '',
      args: [],
    );
  }

  /// `Gaming`
  String get gaming {
    return Intl.message(
      'Gaming',
      name: 'gaming',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get bestSelling {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message(
      'Recommended',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Address`
  String get shippingAddress {
    return Intl.message(
      'Shipping Address',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Orders History`
  String get ordersHistory {
    return Intl.message(
      'Orders History',
      name: 'ordersHistory',
      desc: '',
      args: [],
    );
  }

  /// `Track Orders`
  String get trackOrders {
    return Intl.message(
      'Track Orders',
      name: 'trackOrders',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message(
      'EGP',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Order Signed`
  String get orderSigned {
    return Intl.message(
      'Order Signed',
      name: 'orderSigned',
      desc: '',
      args: [],
    );
  }

  /// `Order Processed`
  String get orderProcessed {
    return Intl.message(
      'Order Processed',
      name: 'orderProcessed',
      desc: '',
      args: [],
    );
  }

  /// `Shipped`
  String get shipped {
    return Intl.message(
      'Shipped',
      name: 'shipped',
      desc: '',
      args: [],
    );
  }

  /// `Out for delivery`
  String get outForDelivery {
    return Intl.message(
      'Out for delivery',
      name: 'outForDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `New Shipping Address`
  String get newShippingAddress {
    return Intl.message(
      'New Shipping Address',
      name: 'newShippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address Title`
  String get addressTitle {
    return Intl.message(
      'Address Title',
      name: 'addressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get addressDetails {
    return Intl.message(
      'Address Details',
      name: 'addressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Change Address`
  String get changeAddress {
    return Intl.message(
      'Change Address',
      name: 'changeAddress',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Credit Cards`
  String get creditCards {
    return Intl.message(
      'Credit Cards',
      name: 'creditCards',
      desc: '',
      args: [],
    );
  }

  /// `COD (Cash On Delivery)`
  String get cod {
    return Intl.message(
      'COD (Cash On Delivery)',
      name: 'cod',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Colour`
  String get colour {
    return Intl.message(
      'Colour',
      name: 'colour',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Write your review`
  String get writeYourReview {
    return Intl.message(
      'Write your review',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `There is something wrong happened`
  String get thereIsSomethingWrongHappened {
    return Intl.message(
      'There is something wrong happened',
      name: 'thereIsSomethingWrongHappened',
      desc: '',
      args: [],
    );
  }

  /// `Added to Cart Succesfully`
  String get addedToCartSuccessfuly {
    return Intl.message(
      'Added to Cart Succesfully',
      name: 'addedToCartSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `It is in your cart already`
  String get itsInYourCartAlready {
    return Intl.message(
      'It is in your cart already',
      name: 'itsInYourCartAlready',
      desc: '',
      args: [],
    );
  }

  /// `It has been Added to wishlist`
  String get itHasBeenAddedToYourWishlist {
    return Intl.message(
      'It has been Added to wishlist',
      name: 'itHasBeenAddedToYourWishlist',
      desc: '',
      args: [],
    );
  }

  /// `It has been removed from wishlist`
  String get itHasBeenRemovedFromYourWishlist {
    return Intl.message(
      'It has been removed from wishlist',
      name: 'itHasBeenRemovedFromYourWishlist',
      desc: '',
      args: [],
    );
  }

  /// `It has been removed from Cart`
  String get itHasBeenRemovedFromYourCart {
    return Intl.message(
      'It has been removed from Cart',
      name: 'itHasBeenRemovedFromYourCart',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome {
    return Intl.message(
      'Welcome,',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to continue`
  String get signInToContinue {
    return Intl.message(
      'Sign in to continue',
      name: 'signInToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin {
    return Intl.message(
      'Sign In',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Facebook`
  String get signInWithFacebook {
    return Intl.message(
      'Sign In With Facebook',
      name: 'signInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign In With Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `field can not be empty`
  String get fieldCantBeEmpty {
    return Intl.message(
      'field can not be empty',
      name: 'fieldCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `You cart looks empty.`
  String get yourCartLooksEmpty {
    return Intl.message(
      'You cart looks empty.',
      name: 'yourCartLooksEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get inStock {
    return Intl.message(
      'In Stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `Out Of Stock`
  String get outOfStock {
    return Intl.message(
      'Out Of Stock',
      name: 'outOfStock',
      desc: '',
      args: [],
    );
  }

  /// `Locate your location on the map`
  String get locateYourLocationOnTheMap {
    return Intl.message(
      'Locate your location on the map',
      name: 'locateYourLocationOnTheMap',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Location`
  String get confirmLocation {
    return Intl.message(
      'Confirm Location',
      name: 'confirmLocation',
      desc: '',
      args: [],
    );
  }

  /// `A 6 - Digit PIN has been sent to your phone number, enter it below to continue.`
  String get a6Digits {
    return Intl.message(
      'A 6 - Digit PIN has been sent to your phone number, enter it below to continue.',
      name: 'a6Digits',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `please allow the location permission.`
  String get pleaseAllowTheLocationPermission {
    return Intl.message(
      'please allow the location permission.',
      name: 'pleaseAllowTheLocationPermission',
      desc: '',
      args: [],
    );
  }

  /// `Your order has been placed successfuly`
  String get yourOrderHasBeenPlacedSuccessfuly {
    return Intl.message(
      'Your order has been placed successfuly',
      name: 'yourOrderHasBeenPlacedSuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Pay failed`
  String get payFailed {
    return Intl.message(
      'Pay failed',
      name: 'payFailed',
      desc: '',
      args: [],
    );
  }

  /// `Tell us your experience`
  String get tellUsYourExperience {
    return Intl.message(
      'Tell us your experience',
      name: 'tellUsYourExperience',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `There are no addresses added yet`
  String get thereAreNoAddressesAddedYet {
    return Intl.message(
      'There are no addresses added yet',
      name: 'thereAreNoAddressesAddedYet',
      desc: '',
      args: [],
    );
  }

  /// `There is nothing in wishlist yet`
  String get thereIsNothingInWishlistYet {
    return Intl.message(
      'There is nothing in wishlist yet',
      name: 'thereIsNothingInWishlistYet',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any orders yet`
  String get youDonotHaveAnyOrdersYet {
    return Intl.message(
      'You do not have any orders yet',
      name: 'youDonotHaveAnyOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `You do not have any notifications yet`
  String get youDonotHaveAnyNotificationsYet {
    return Intl.message(
      'You do not have any notifications yet',
      name: 'youDonotHaveAnyNotificationsYet',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
