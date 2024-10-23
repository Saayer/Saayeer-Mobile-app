import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'package:saayer/core/services/navigation/route_names.dart';
import 'package:saayer/features/address/add_edit_address/presentation/screens/add_edit_address_screen.dart';
import 'package:saayer/features/address/address_details/presentation/screens/address_details_screen.dart';
import 'package:saayer/features/intro/presentation/screens/intro_screen.dart';
import 'package:saayer/features/log_in/presentation/screens/log_in_screen.dart';
import 'package:saayer/features/more_sub_features/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:saayer/features/more_sub_features/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:saayer/features/more_sub_features/settings/presentation/screens/settings_screen.dart';
import 'package:saayer/features/more_sub_features/static_pages/core/enums/enums.dart';
import 'package:saayer/features/more_sub_features/static_pages/presentation/screens/static_pages_screen.dart';
import 'package:saayer/features/more_sub_features/stores/add_edit_store/presentation/screens/add_edit_store_screen.dart';
import 'package:saayer/features/more_sub_features/stores/stores_list/presentation/screens/stores_list_screen.dart';
import 'package:saayer/features/more_sub_features/why_saayer/presentation/screens/why_saayer_screen.dart';
import 'package:saayer/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:saayer/features/profile_sub_features/info/domain/entities/info_entity.dart';
import 'package:saayer/features/profile_sub_features/info/presentation/screens/info_screen.dart';
import 'package:saayer/features/request_new_shipment/presentation/screens/request_new_shipment_screen.dart';
import 'package:saayer/features/request_new_shipment/sub_features/shipment_payment/presentation/widgets/payment_success_widget.dart';
import 'package:saayer/features/shipment_details_tracking_info/presentation/screens/shipment_details_screen.dart';
import 'package:saayer/features/splash/presentation/screens/splash_screen.dart';
import 'package:saayer/features/user_info_view_page/presentation/screens/user_info_view_page_screen.dart';
import 'package:saayer/features/verify_otp/presentation/screens/verify_otp_screen.dart';
import 'package:saayer/features/view_page/core/utils/enums/enums.dart';
import 'package:saayer/features/view_page/presentation/screens/view_page_screen.dart';

class AppRoutes {
  /// onGenerateRoute
  Route<dynamic> generateRoute(RouteSettings settings) {
    /// this used with web platform when payment callback url start with [Routes.paymentSuccessNamedPage]
    /// to get params from callback URL to complete payment process
    if (settings.name!.contains(Routes.paymentSuccessNamedPage)) {
      return MaterialPageRoute(builder: (context) => const PaymentSuccessWidget());
    }
    var routingData = settings.arguments;
    switch (settings.name) {
      case Routes.splashNamedPage:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginNamedPage:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case Routes.verifyOtpNamedPage:
        return MaterialPageRoute(
            builder: (context) => VerifyOtpScreen(
                  tokenRequestDto: routingData as TokenRequestDto,
                ));
      case Routes.introNamedPage:
        return MaterialPageRoute(builder: (context) => const IntroScreen());
      case Routes.viewPageNamedPage:
        return MaterialPageRoute(
            builder: (context) => ViewPageScreen(
                  navBarIconType: (routingData as NavBarIconTypes?) ?? NavBarIconTypes.HOME,
                ));
      case Routes.addEditAddressNamedPage:
        return MaterialPageRoute(
            builder: (context) => AddEditAddressScreen(
                  isAddShipmentRequest: (routingData as Map)['isAddShipmentRequest'],
                  addEditAddressType: routingData['addEditAddressType'],
                  customerModel: routingData['customerModel'],
                ));
      case Routes.addressDetailsNamedPage:
        return MaterialPageRoute(
            builder: (context) => AddressDetailsScreen(
                  addressInfoEntity: (routingData as Map)['addressInfoEntity'] as CustomerGetDto,
                  onDelete: routingData['onDelete'] as Function(),
                ));
      case Routes.requestNewShipmentNamedPage:
        return MaterialPageRoute(builder: (context) => const RequestNewShipmentScreen());
      case Routes.personalInfoNamedPage:
        return MaterialPageRoute(builder: (context) => const PersonalInfoScreen());
      case Routes.addEditStoreNamedPage:
        return MaterialPageRoute(
            builder: (context) => AddEditStoreScreen(
                  addEditStoreType: (routingData as Map)['addEditStoreType'],
                  storeDto: routingData['storeDto'],
                ));
      case Routes.shipmentDetailsNamedPage:
        return MaterialPageRoute(
            builder: (context) => ShipmentDetailsScreen(
                  shipmentDto: routingData as ShipmentGetDto,
                ));
      case Routes.userInfoViewNamedPage:
        return MaterialPageRoute(
            builder: (context) => UserInfoViewPageScreen(
                  initialPage: routingData as int,
                ));
      case Routes.notificationsNamedPage:
        return MaterialPageRoute(builder: (context) => const NotificationsScreen());
      case Routes.infoNamedPage:
        return MaterialPageRoute(builder: (context) => InfoScreen(infoEntity: routingData as InfoEntity));
      case Routes.paymentSuccessNamedPage:
        return MaterialPageRoute(builder: (context) => const PaymentSuccessWidget());
      case Routes.settingsNamedPage:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case Routes.storesListNamedPage:
        return MaterialPageRoute(builder: (context) => const StoresListScreen());
      case Routes.contactUsNamedPage:
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());
      case Routes.whySaayerNamedPage:
        return MaterialPageRoute(builder: (context) => const WhySaayerScreen());
      case Routes.staticPagesNamedPage:
        return MaterialPageRoute(
            builder: (context) => StaticPagesScreen(
                  staticPagesTypes: routingData as StaticPagesTypes,
                ));

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
