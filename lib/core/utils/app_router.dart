import 'package:go_router/go_router.dart';
import 'package:shop_deal/features/account/views/account_view.dart';
import 'package:shop_deal/features/account/views/edit_profile_view.dart';
import 'package:shop_deal/features/account/views/google_maps_view.dart';
import 'package:shop_deal/features/account/views/language_view.dart';
import 'package:shop_deal/features/account/views/new_address_view.dart';
import 'package:shop_deal/features/account/views/notifications_view.dart';
import 'package:shop_deal/features/account/views/order_history_view.dart';
import 'package:shop_deal/features/account/views/shipping_address_view.dart';
import 'package:shop_deal/features/account/views/theme_view.dart';
import 'package:shop_deal/features/account/views/track_order_view.dart';
import 'package:shop_deal/features/account/views/view_order_view.dart';
import 'package:shop_deal/features/account/views/wishlist_view.dart';
import 'package:shop_deal/features/authentication/views/phone_number_verification_view.dart';
import 'package:shop_deal/features/authentication/views/login_view.dart';
import 'package:shop_deal/features/authentication/views/signup_view.dart';
import 'package:shop_deal/features/cart/views/cart_view.dart';
import 'package:shop_deal/features/checkout/models/order_model.dart';
import 'package:shop_deal/features/checkout/views/checkout_view.dart';
import 'package:shop_deal/features/checkout/views/order_summary_view.dart';
import 'package:shop_deal/features/checkout/views/pay_with_credit_card_view.dart';
import 'package:shop_deal/features/explore/models/product_model.dart';
import 'package:shop_deal/features/explore/views/best_selling_view.dart';
import 'package:shop_deal/features/explore/views/category_view.dart';
import 'package:shop_deal/features/explore/views/item_details_view.dart';
import 'package:shop_deal/features/explore/views/recommended_view.dart';
import 'package:shop_deal/features/explore/views/search_view.dart';
import 'package:shop_deal/features/explore/views/write_review_view.dart';
import 'package:shop_deal/features/root/views/root_view.dart';
import 'package:shop_deal/features/splash/splash_view.dart';

class AppRouter {
  static const splashView = "/";
  static const logInView = "/logInView";
  static const signUpView = "/signUpView";
  static const phoneNumberVerificationView = "/phoneNumberVerificationView";
  static const rootView = "/rootView";
  static const categoryView = "/categoryView";
  static const itemDetailsView = "/itemDetailsView";
  static const writeReviewView = "/writeReviewView";
  static const cartView = "/cartView";
  static const accountView = "/accountView";
  static const shippingAddressView = "/shippingAddressView";
  static const wishListView = "/wishListView";
  static const trackOrderView = "/trackOrderView";
  static const viewOrderView = "/viewOrderView";
  static const checkoutView = "/checkoutView";
  static const orderSummaryView = "/orderSummaryView";
  static const editProfileView = "/editProfileView";
  static const newAddressView = "/newAddressView";
  static const payWithCreditCardView = "/payWithCreditCardView";
  static const orderHistoryView = "/orderHistoryView";
  static const languageView = "/languageView";
  static const themeView = "/themeView";
  static const bestSellingView = "/bestSellingView";
  static const recommendedView = "/recommendedView";
  static const googleMapsView = "/googleMapsView";
  static const notificationsView = "/notificationsView";
  static const searchView = "/searchView";

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: logInView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: phoneNumberVerificationView,
        builder: (context, state) => PhoneNumberVerificationView(
          isFromLogin: state.extra as bool?,
        ),
      ),
      GoRoute(
        path: rootView,
        builder: (context, state) => const RootView(),
      ),
      GoRoute(
        path: categoryView,
        builder: (context, state) => CategoryView(
          index: state.extra as int,
        ),
      ),
      GoRoute(
        path: itemDetailsView,
        builder: (context, state) => ItemDetailsView(
          item: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: writeReviewView,
        builder: (context, state) => WriteReviewView(
          product: state.extra as ProductModel,
        ),
      ),
      GoRoute(
        path: cartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: accountView,
        builder: (context, state) => const AccountView(),
      ),
      GoRoute(
        path: shippingAddressView,
        builder: (context, state) => const ShippingAddressView(),
      ),
      GoRoute(
        path: wishListView,
        builder: (context, state) => const WishlistView(),
      ),
      GoRoute(
        path: trackOrderView,
        builder: (context, state) => const TrackOrderView(),
      ),
      GoRoute(
        path: viewOrderView,
        builder: (context, state) => ViewOrderView(
          order: state.extra as OrderModel,
        ),
      ),
      GoRoute(
        path: checkoutView,
        builder: (context, state) => const CheckoutView(),
      ),
      GoRoute(
        path: editProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: newAddressView,
        builder: (context, state) => const NewAddressView(),
      ),
      GoRoute(
        path: orderHistoryView,
        builder: (context, state) => const OrderHistoryView(),
      ),
      GoRoute(
        path: orderSummaryView,
        builder: (context, state) => const OrderSummaryView(),
      ),
      GoRoute(
        path: payWithCreditCardView,
        builder: (context, state) => const PayWithCreditCardView(),
      ),
      GoRoute(
        path: payWithCreditCardView,
        builder: (context, state) => const PayWithCreditCardView(),
      ),
      GoRoute(
        path: languageView,
        builder: (context, state) => const LanguageView(),
      ),
      GoRoute(
        path: themeView,
        builder: (context, state) => const ThemeView(),
      ),
      GoRoute(
        path: bestSellingView,
        builder: (context, state) => BestSellingView(
          bestSellingProducts: state.extra as List<ProductModel>,
        ),
      ),
      GoRoute(
        path: recommendedView,
        builder: (context, state) => RecommendedView(
          recommendedProducts: state.extra as List<ProductModel>,
        ),
      ),
      GoRoute(
        path: googleMapsView,
        builder: (context, state) => const GoogleMapsView(),
      ),
      GoRoute(
        path: notificationsView,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
