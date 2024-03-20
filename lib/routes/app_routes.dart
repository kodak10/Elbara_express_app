import 'package:elbara_express/presentation/add_address_screen/add_address_screen.dart';
import 'package:elbara_express/presentation/add_address_screen/binding/add_address_binding.dart';
import 'package:elbara_express/presentation/add_adress_screen/add_adress_screen.dart';
import 'package:elbara_express/presentation/add_adress_screen/binding/add_adress_binding.dart';
import 'package:elbara_express/presentation/add_card_active_screen/add_card_active_screen.dart';
import 'package:elbara_express/presentation/add_card_active_screen/binding/add_card_active_binding.dart';
import 'package:elbara_express/presentation/add_card_defualt_screen/add_card_defualt_screen.dart';
import 'package:elbara_express/presentation/add_card_defualt_screen/binding/add_card_defualt_binding.dart';
import 'package:elbara_express/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:elbara_express/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:elbara_express/presentation/calculate_price_one_screen/binding/calculate_price_one_binding.dart';
import 'package:elbara_express/presentation/calculate_price_one_screen/calculate_price_one_screen.dart';
import 'package:elbara_express/presentation/calculate_price_screen/binding/calculate_price_binding.dart';
import 'package:elbara_express/presentation/calculate_price_screen/calculate_price_screen.dart';
import 'package:elbara_express/presentation/cancel_order_one_screen/binding/cancel_order_one_binding.dart';
import 'package:elbara_express/presentation/cancel_order_one_screen/cancel_order_one_screen.dart';
import 'package:elbara_express/presentation/cancel_order_screen/binding/cancel_order_binding.dart';
import 'package:elbara_express/presentation/cancel_order_screen/cancel_order_screen.dart';
import 'package:elbara_express/presentation/city_selection_screen/binding/city_selection_binding.dart';
import 'package:elbara_express/presentation/city_selection_screen/city_selection_screen.dart';
import 'package:elbara_express/presentation/courier_services_screen/binding/courier_services_binding.dart';
import 'package:elbara_express/presentation/courier_services_screen/courier_services_screen.dart';
import 'package:elbara_express/presentation/customer_support_screen/binding/customer_support_binding.dart';
import 'package:elbara_express/presentation/customer_support_screen/customer_support_screen.dart';
import 'package:elbara_express/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:elbara_express/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:elbara_express/presentation/empty_address_screen/binding/empty_address_binding.dart';
import 'package:elbara_express/presentation/empty_address_screen/empty_address_screen.dart';
import 'package:elbara_express/presentation/empty_my_orders_screen/binding/empty_my_orders_binding.dart';
import 'package:elbara_express/presentation/empty_my_orders_screen/empty_my_orders_screen.dart';
import 'package:elbara_express/presentation/empty_notifications_screen/binding/empty_notifications_binding.dart';
import 'package:elbara_express/presentation/empty_notifications_screen/empty_notifications_screen.dart';
import 'package:elbara_express/presentation/empty_payment_screen/binding/empty_payment_binding.dart';
import 'package:elbara_express/presentation/empty_payment_screen/empty_payment_screen.dart';
import 'package:elbara_express/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:elbara_express/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:elbara_express/presentation/gestionnaire_gare/pages/OrderDetails.dart';
import 'package:elbara_express/presentation/grid_screen/binding/grid_binding.dart';
import 'package:elbara_express/presentation/grid_screen/grid_screen.dart';
import 'package:elbara_express/presentation/home_container1_screen/binding/home_container1_binding.dart';
import 'package:elbara_express/presentation/home_container1_screen/home_container1_screen.dart';
import 'package:elbara_express/presentation/live_tracking_one_screen/binding/live_tracking_one_binding.dart';
import 'package:elbara_express/presentation/live_tracking_one_screen/live_tracking_one_screen.dart';
import 'package:elbara_express/presentation/live_tracking_screen/binding/live_tracking_binding.dart';
import 'package:elbara_express/presentation/live_tracking_screen/live_tracking_screen.dart';
import 'package:elbara_express/presentation/live_tracking_two_screen/binding/live_tracking_two_binding.dart';
import 'package:elbara_express/presentation/live_tracking_two_screen/live_tracking_two_screen.dart';
import 'package:elbara_express/presentation/log_in_screen/binding/log_in_binding.dart';
import 'package:elbara_express/presentation/log_in_screen/log_in_screen.dart';
import 'package:elbara_express/presentation/log_out_screen/binding/log_out_binding.dart';
import 'package:elbara_express/presentation/log_out_screen/log_out_screen.dart';
import 'package:elbara_express/presentation/login_with_error_screen/binding/login_with_error_binding.dart';
import 'package:elbara_express/presentation/login_with_error_screen/login_with_error_screen.dart';
import 'package:elbara_express/presentation/my_address_screen/binding/my_address_binding.dart';
import 'package:elbara_express/presentation/my_address_screen/my_address_screen.dart';
import 'package:elbara_express/presentation/onboarding_one_screen/binding/onboarding_one_binding.dart';
import 'package:elbara_express/presentation/onboarding_one_screen/onboarding_one_screen.dart';
import 'package:elbara_express/presentation/onboarding_three_screen/binding/onboarding_three_binding.dart';
import 'package:elbara_express/presentation/onboarding_three_screen/onboarding_three_screen.dart';
import 'package:elbara_express/presentation/onboarding_two_screen/binding/onboarding_two_binding.dart';
import 'package:elbara_express/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:elbara_express/presentation/order_success_screen/binding/order_success_binding.dart';
import 'package:elbara_express/presentation/order_success_screen/order_success_screen.dart';
import 'package:elbara_express/presentation/order_tracking_screen/binding/order_tracking_binding.dart';
import 'package:elbara_express/presentation/order_tracking_screen/order_tracking_screen.dart';
import 'package:elbara_express/presentation/password_reset_success_screen/binding/password_reset_success_binding.dart';
import 'package:elbara_express/presentation/password_reset_success_screen/password_reset_success_screen.dart';
import 'package:elbara_express/presentation/payment_method_one_screen/binding/payment_method_one_binding.dart';
import 'package:elbara_express/presentation/payment_method_one_screen/payment_method_one_screen.dart';
import 'package:elbara_express/presentation/payment_method_screen/binding/payment_method_binding.dart';
import 'package:elbara_express/presentation/payment_method_screen/payment_method_screen.dart';
import 'package:elbara_express/presentation/privacy_policy_screen/binding/privacy_policy_binding.dart';
import 'package:elbara_express/presentation/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:elbara_express/presentation/profile_details_screen/binding/profile_details_binding.dart';
import 'package:elbara_express/presentation/profile_details_screen/profile_details_screen.dart';
import 'package:elbara_express/presentation/recently_shipped_screen/binding/recently_shipped_binding.dart';
import 'package:elbara_express/presentation/recently_shipped_screen/recently_shipped_screen.dart';
import 'package:elbara_express/presentation/reset_password_screen/binding/reset_password_binding.dart';
import 'package:elbara_express/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:elbara_express/presentation/select_courier_service_screen/binding/select_courier_service_binding.dart';
import 'package:elbara_express/presentation/select_courier_service_screen/select_courier_service_screen.dart';
import 'package:elbara_express/presentation/select_delivery_address_screen/binding/select_delivery_address_binding.dart';
import 'package:elbara_express/presentation/select_delivery_address_screen/select_delivery_address_screen.dart';
import 'package:elbara_express/presentation/select_pickup_address_screen/binding/select_pickup_address_binding.dart';
import 'package:elbara_express/presentation/select_pickup_address_screen/select_pickup_address_screen.dart';
import 'package:elbara_express/presentation/send_package_screen/binding/send_package_binding.dart';
import 'package:elbara_express/presentation/send_package_screen/send_package_screen.dart';
import 'package:elbara_express/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:elbara_express/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:elbara_express/presentation/splash_one_screen/binding/splash_one_binding.dart';
import 'package:elbara_express/presentation/splash_one_screen/splash_one_screen.dart';
import 'package:elbara_express/presentation/splash_screen/binding/splash_binding.dart';
import 'package:elbara_express/presentation/splash_screen/splash_screen.dart';
import 'package:elbara_express/presentation/splash_two_screen/binding/splash_two_binding.dart';
import 'package:elbara_express/presentation/splash_two_screen/splash_two_screen.dart';
import 'package:elbara_express/presentation/tracking_details_one_screen/binding/tracking_details_one_binding.dart';
import 'package:elbara_express/presentation/tracking_details_one_screen/tracking_details_one_screen.dart';
import 'package:elbara_express/presentation/tracking_details_screen/binding/tracking_details_binding.dart';
import 'package:elbara_express/presentation/tracking_details_screen/tracking_details_screen.dart';
import 'package:elbara_express/presentation/tracking_details_two_screen/binding/tracking_details_two_binding.dart';
import 'package:elbara_express/presentation/tracking_details_two_screen/tracking_details_two_screen.dart';
import 'package:elbara_express/presentation/verification_screen/binding/verification_binding.dart';
import 'package:elbara_express/presentation/verification_screen/verification_screen.dart';
import 'package:elbara_express/presentation/verification_with_error_screen/binding/verification_with_error_binding.dart';
import 'package:elbara_express/presentation/verification_with_error_screen/verification_with_error_screen.dart';
import 'package:elbara_express/presentation/gestionnaire_gare/pages/dashboard.dart';
import 'package:get/get.dart';

import '../presentation/chatbot/chatbot_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String gridScreen = '/grid_screen';

  static const String splashOneScreen = '/splash_one_screen';

  static const String splashTwoScreen = '/splash_two_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String logInScreen = '/log_in_screen';

  static const String loginWithErrorScreen = '/login_with_error_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verificationScreen = '/verification_screen';

  static const String verificationWithErrorScreen =
      '/verification_with_error_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String passwordResetSuccessScreen =
      '/password_reset_success_screen';

  static const String citySelectionScreen = '/city_selection_screen';

  static const String homeContainerPage = '/home_container_page';

  static const String homeContainer1Screen = '/home_container1_screen';

  static const String homeGestionnaireScreen = '/home_gestionnaire_gare_screen';


  static const String sendPackageScreen = '/send_package_screen';

  static const String selectPickupAddressScreen =
      '/select_pickup_address_screen';

  static const String selectDeliveryAddressScreen =
      '/select_delivery_address_screen';

  static const String addAddressScreen = '/add_address_screen';

  static const String selectCourierServiceScreen =
      '/select_courier_service_screen';

  static const String paymentMethodScreen = '/payment_method_screen';

  static const String orderSuccessScreen = '/order_success_screen';

  static const String calculatePriceOneScreen = '/calculate_price_one_screen';

  static const String calculatePriceScreen = '/calculate_price_screen';

  static const String orderTrackingScreen = '/order_tracking_screen';

  static const String trackingDetailsScreen = '/tracking_details_screen';

  static const String liveTrackingTwoScreen = '/live_tracking_two_screen';

  static const String courierServicesScreen = '/courier_services_screen';
  static const String chatBotScreen = '/chatbot_screen';

  static const String recentlyShippedScreen = '/recently_shipped_screen';

  static const String trackingDetailsTwoScreen = '/tracking_details_two_screen';

  static const String liveTrackingScreen = '/live_tracking_screen';

  static const String emptyMyOrdersScreen = '/empty_my_orders_screen';

  static const String myOrdersPage = '/my_orders_page';

  static const String orderDetailsInTransitScreen =
      '/order_details_in_transit_screen';

  static const String cancelOrderScreen = '/cancel_order_screen';

  static const String trackingDetailsOneScreen = '/tracking_details_one_screen';

  static const String liveTrackingOneScreen = '/live_tracking_one_screen';

  static const String emptyNotificationsScreen = '/empty_notifications_screen';

  static const String notificationsPage = '/notifications_page';

  static const String profilePage = '/profile_page';

  static const String profileDetailsScreen = '/profile_details_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String emptyPaymentScreen = '/empty_payment_screen';

  static const String addCardDefualtScreen = '/add_card_defualt_screen';

  static const String addCardActiveScreen = '/add_card_active_screen';

  static const String paymentMethodOneScreen = '/payment_method_one_screen';

  static const String emptyAddressScreen = '/empty_address_screen';

  static const String myAddressScreen = '/my_address_screen';

  static const String addAdressScreen = '/add_adress_screen';

  static const String editAndDeleteAddressScreen =
      '/edit_and_delete_address_screen';

  static const String cancelOrderOneScreen = '/cancel_order_one_screen';

  static const String editAddressScreen = '/edit_address_screen';

  static const String customerSupportScreen = '/customer_support_screen';

  static const String privacyPolicyScreen = '/privacy_policy_screen';

  static const String logOutScreen = '/log_out_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  

  static const String initialRoute = '/initialRoute';

//Gestionnaire
  static const String gestionnaireOrderDetailPage = '/gestionaire_order_details';


  static List<GetPage> pages = [

    // Gestionnaire gare
    GetPage(
      name: gestionnaireOrderDetailPage,
      page: () => OrderDetailsPage(orderId: '',),
      // bindings: [
      //   OrderDetailsPage(),
      // ],
    ),



    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: gridScreen,
      page: () => GridScreen(),
      bindings: [
        GridBinding(),
      ],
    ),
    GetPage(
      name: splashOneScreen,
      page: () => SplashOneScreen(),
      bindings: [
        SplashOneBinding(),
      ],
    ),
    GetPage(
      name: splashTwoScreen,
      page: () => SplashTwoScreen(),
      bindings: [
        SplashTwoBinding(),
      ],
    ),
    GetPage(
      name: onboardingOneScreen,
      page: () => OnboardingOneScreen(),
      bindings: [
        OnboardingOneBinding(),
      ],
    ),
    GetPage(
      name: onboardingThreeScreen,
      page: () => OnboardingThreeScreen(),
      bindings: [
        OnboardingThreeBinding(),
      ],
    ),
    GetPage(
      name: onboardingTwoScreen,
      page: () => OnboardingTwoScreen(),
      bindings: [
        OnboardingTwoBinding(),
      ],
    ),
    GetPage(
      name: logInScreen,
      page: () => LogInScreen(),
      bindings: [
        LogInBinding(),
      ],
    ),
    GetPage(
      name: loginWithErrorScreen,
      page: () => LoginWithErrorScreen(),
      bindings: [
        LoginWithErrorBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verificationScreen,
      page: () => VerificationScreen(),
      bindings: [
        VerificationBinding(),
      ],
    ),
    GetPage(
      name: verificationWithErrorScreen,
      page: () => VerificationWithErrorScreen(),
      bindings: [
        VerificationWithErrorBinding(),
      ],
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      bindings: [
        ResetPasswordBinding(),
      ],
    ),
    GetPage(
      name: passwordResetSuccessScreen,
      page: () => PasswordResetSuccessScreen(),
      bindings: [
        PasswordResetSuccessBinding(),
      ],
    ),
    GetPage(
      name: citySelectionScreen,
      page: () => CitySelectionScreen(),
      bindings: [
        CitySelectionBinding(),
      ],
    ),
    GetPage(
      name: homeContainer1Screen,
      page: () => HomeContainer1Screen(),
      bindings: [
        HomeContainer1Binding(),
      ],
    ),
    GetPage(
      name: sendPackageScreen,
      page: () => SendPackageScreen(),
      bindings: [
        SendPackageBinding(),
      ],
    ),
    GetPage(
      name: selectPickupAddressScreen,
      page: () => SelectPickupAddressScreen(),
      bindings: [
        SelectPickupAddressBinding(),
      ],
    ),
    GetPage(
      name: selectDeliveryAddressScreen,
      page: () => SelectDeliveryAddressScreen(),
      bindings: [
        SelectDeliveryAddressBinding(),
      ],
    ),
    GetPage(
      name: addAddressScreen,
      page: () => AddAddressScreen(),
      bindings: [
        AddAddressBinding(),
      ],
    ),
    GetPage(
      name: selectCourierServiceScreen,
      page: () => SelectCourierServiceScreen(),
      bindings: [
        SelectCourierServiceBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodScreen,
      page: () => PaymentMethodScreen(),
      bindings: [
        PaymentMethodBinding(),
      ],
    ),
    GetPage(
      name: orderSuccessScreen,
      page: () => OrderSuccessScreen(),
      bindings: [
        OrderSuccessBinding(),
      ],
    ),
    GetPage(
      name: calculatePriceOneScreen,
      page: () => CalculatePriceOneScreen(),
      bindings: [
        CalculatePriceOneBinding(),
      ],
    ),
    GetPage(
      name: calculatePriceScreen,
      page: () => CalculatePriceScreen(),
      bindings: [
        CalculatePriceBinding(),
      ],
    ),
    GetPage(
      name: orderTrackingScreen,
      page: () => OrderTrackingScreen(),
      bindings: [
        OrderTrackingBinding(),
      ],
    ),
    GetPage(
      name: trackingDetailsScreen,
      page: () => TrackingDetailsScreen(orderId: '',), // parfait
      bindings: [
        TrackingDetailsBinding(),
      ],
    ),
    GetPage(
      name: liveTrackingTwoScreen,
      page: () => LiveTrackingTwoScreen(),
      bindings: [
        LiveTrackingTwoBinding(),
      ],
    ),
    GetPage(
      name: courierServicesScreen,
      page: () => CourierServicesScreen(),
      bindings: [
        CourierServicesBinding(),
      ],
    ),

    GetPage(
      name: chatBotScreen,
      page: () => ChatbotScreen(),
      bindings: [
        CourierServicesBinding(),
      ],
    ),
    GetPage(
      name: recentlyShippedScreen,
      page: () => RecentlyShippedScreen(),
      bindings: [
        RecentlyShippedBinding(),
      ],
    ),
    GetPage(
      name: trackingDetailsTwoScreen,
      page: () => TrackingDetailsTwoScreen(),
      bindings: [
        TrackingDetailsTwoBinding(),
      ],
    ),
    GetPage(
      name: liveTrackingScreen,
      page: () => LiveTrackingScreen(),
      bindings: [
        LiveTrackingBinding(),
      ],
    ),
    GetPage(
      name: emptyMyOrdersScreen,
      page: () => EmptyMyOrdersScreen(),
      bindings: [
        EmptyMyOrdersBinding(),
      ],
    ),
    GetPage(
      name: homeGestionnaireScreen,
      page: () => DashboardGestionnaireGare(),
      // bindings: [
      //   HomeGareScreen(),
      // ],
    ),
    
    // GetPage(
    //   name: orderDetailsInTransitScreen,
    //   page: () => OrderDetailsInTransitScreen(),
    //   bindings: [
    //     OrderDetailsInTransitBinding(),
    //   ],
    // ),
    GetPage(
      name: cancelOrderScreen,
      page: () => CancelOrderScreen(),
      bindings: [
        CancelOrderBinding(),
      ],
    ),
    GetPage(
      name: trackingDetailsOneScreen,
      page: () => TrackingDetailsOneScreen(),
      bindings: [
        TrackingDetailsOneBinding(),
      ],
    ),
    GetPage(
      name: liveTrackingOneScreen,
      page: () => LiveTrackingOneScreen(),
      bindings: [
        LiveTrackingOneBinding(),
      ],
    ),
    GetPage(
      name: emptyNotificationsScreen,
      page: () => EmptyNotificationsScreen(),
      bindings: [
        EmptyNotificationsBinding(),
      ],
    ),
    GetPage(
      name: profileDetailsScreen,
      page: () => ProfileDetailsScreen(),
      bindings: [
        ProfileDetailsBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: emptyPaymentScreen,
      page: () => EmptyPaymentScreen(),
      bindings: [
        EmptyPaymentBinding(),
      ],
    ),
    GetPage(
      name: addCardDefualtScreen,
      page: () => AddCardDefualtScreen(),
      bindings: [
        AddCardDefualtBinding(),
      ],
    ),
    GetPage(
      name: addCardActiveScreen,
      page: () => AddCardActiveScreen(),
      bindings: [
        AddCardActiveBinding(),
      ],
    ),
    GetPage(
      name: paymentMethodOneScreen,
      page: () => PaymentMethodOneScreen(),
      bindings: [
        PaymentMethodOneBinding(),
      ],
    ),
    GetPage(
      name: emptyAddressScreen,
      page: () => EmptyAddressScreen(),
      bindings: [
        EmptyAddressBinding(),
      ],
    ),
    GetPage(
      name: myAddressScreen,
      page: () => MyAddressScreen(),
      bindings: [
        MyAddressBinding(),
      ],
    ),
    GetPage(
      name: addAdressScreen,
      page: () => AddAdressScreen(),
      bindings: [
        AddAdressBinding(),
      ],
    ),
    // GetPage(
    //   name: editAndDeleteAddressScreen,
    //   page: () => EditAndDeleteAddressScreen(),
    //   bindings: [
    //     EditAndDeleteAddressBinding(),
    //   ],
    // ),
    GetPage(
      name: cancelOrderOneScreen,
      page: () => CancelOrderOneScreen(),
      bindings: [
        CancelOrderOneBinding(),
      ],
    ),
    // GetPage(
    //   name: editAddressScreen,
    //   page: () => EditAddressScreen(),
    //   bindings: [
    //     EditAddressBinding(),
    //   ],
    // ),
    GetPage(
      name: customerSupportScreen,
      page: () => CustomerSupportScreen(),
      bindings: [
        CustomerSupportBinding(),
      ],
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      bindings: [
        PrivacyPolicyBinding(),
      ],
    ),
    GetPage(
      name: logOutScreen,
      page: () => LogOutScreen(),
      bindings: [
        LogOutBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
