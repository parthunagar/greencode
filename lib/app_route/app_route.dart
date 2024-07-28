import 'package:get/get.dart';
import 'package:greencode/screen/booking/booking_binding.dart';
import 'package:greencode/screen/booking/booking_view.dart';
import 'package:greencode/screen/booking_details/booking_details_binding.dart';
import 'package:greencode/screen/booking_details/booking_details_view.dart';
import 'package:greencode/screen/change_password/change_password_binding.dart';
import 'package:greencode/screen/change_password/change_password_view.dart';
import 'package:greencode/screen/contact_us/contact_us_binding.dart';
import 'package:greencode/screen/contact_us/contact_us_view.dart';
import 'package:greencode/screen/dashboard/dashboard_binding.dart';
import 'package:greencode/screen/dashboard/dashboard_view.dart';
import 'package:greencode/screen/e_resident_card/e_residence_card_binding.dart';
import 'package:greencode/screen/e_resident_card/e_resident_card_view.dart';
import 'package:greencode/screen/easy_living_details/category_bus_details/category_bus_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_bus_details/category_bus_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_bus_station_list/category_bus_station_list_binding.dart';
import 'package:greencode/screen/easy_living_details/category_bus_station_list/category_bus_station_list_view.dart';
import 'package:greencode/screen/easy_living_details/category_library_details/category_library_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_library_details/category_library_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_mtr_details/category_mtr_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_mtr_details/category_mtr_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_post_office_details/category_post_office_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_post_office_details/category_post_office_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_sport_center_details/category_sport_center_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_sport_center_details/category_sport_center_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_taxi_details/category_taxi_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_taxi_details/category_taxi_details_view.dart';
import 'package:greencode/screen/easy_living_details/category_web_market_details/category_web_market_details_binding.dart';
import 'package:greencode/screen/easy_living_details/category_web_market_details/category_web_market_details_view.dart';
import 'package:greencode/screen/easy_living_info/easy_living_info_binding.dart';
import 'package:greencode/screen/easy_living_info/easy_living_info_view.dart';
import 'package:greencode/screen/estate_fund_types/estate_fund_list_binding.dart';
import 'package:greencode/screen/estate_fund_types/estate_fund_list_view.dart';
import 'package:greencode/screen/estate_info/estate_info_binding.dart';
import 'package:greencode/screen/estate_info/estate_info_view.dart';
import 'package:greencode/screen/forgot_password/forgot_password_binding.dart';
import 'package:greencode/screen/forgot_password/forgot_password_view.dart';
import 'package:greencode/screen/home/home_binding.dart';
import 'package:greencode/screen/home/home_view.dart';
import 'package:greencode/screen/notice_details/notice_details_binding.dart';
import 'package:greencode/screen/notice_details/notice_details_view.dart';
import 'package:greencode/screen/notification/notification_binding.dart';
import 'package:greencode/screen/notification/notification_view.dart';
import 'package:greencode/screen/otp_verification/otp_verification_binding.dart';
import 'package:greencode/screen/otp_verification/otp_verification_view.dart';
import 'package:greencode/screen/past_records/past_records_binding.dart';
import 'package:greencode/screen/pending_status/pending_status_binding.dart';
import 'package:greencode/screen/qr_code/qr_code_binding.dart';
import 'package:greencode/screen/qr_code/qr_code_view.dart';
import 'package:greencode/screen/register/register_binding.dart';
import 'package:greencode/screen/register/register_view.dart';
import 'package:greencode/screen/register/register_with_email/register_with_email_binding.dart';
import 'package:greencode/screen/register/register_with_email/register_with_email_controller.dart';
import 'package:greencode/screen/register/register_with_email/register_with_email_view.dart';
import 'package:greencode/screen/reservation/reservation_binding.dart';
import 'package:greencode/screen/reservation/reservation_view.dart';
import 'package:greencode/screen/reset_password/reset_password_binding.dart';
import 'package:greencode/screen/reset_password/reset_password_view.dart';
import 'package:greencode/screen/setting/setting_binding.dart';
import 'package:greencode/screen/setting/setting_view.dart';
import 'package:greencode/screen/sign_in/sign_in_binding.dart';
import 'package:greencode/screen/sign_in/sign_in_view.dart';

class AppRoute {
  static String registerScreen = "/register_screen";
  static String registerEmailScreen = "/register_email_screen";
  static String signInScreen = "/sign_in_screen";
  static String forgotPasswordScreen = "/forgot_password_screen";
  static String otpVerificationScreen = "/otp_verification_screen";
  static String resetPasswordScreen = "/reset_password_screen";
  static String homeScreen = "/home_screen";
  static String dashboardScreen = "/dashboard_screen";
  static String qrCodeScreen = "/qr_code_screen";
  static String bookingScreen = "/booking_screen";
  static String notificationScreen = "/notification_screen";
  static String estateInfoListScreen = "/estate_info_list_screen";
  static String estateFundListScreen = "/estate_fund_list_screen";
  static String noticeDetailsScreen = "/notice_details_screen";
  static String reservationRecordsScreen = "/reservation_records_screen";
  static String bookingDetailsScreen = "/bookingDetailsScreen";
  static String easyLivingInfo = "/estateLivingInfo";
  static String easyLivingMTRCategory = "/easyLivingMTRCategory";
  static String easyLivingBusCategory = "/easyLivingBusCategory";
  static String easyLivingBusStation = "/easyLivingBusStation";
  static String easyLivingTaxi = "/easyLivingTaxi";
  static String easyLivingLibrary = "/easyLivingLibrary";
  static String easyLivingPostOffice = "/easyLivingPostOffice";
  static String easyLivingWebMarket = "/easyLivingWebMarket";
  static String easyLivingSportCenter = "/easyLivingSportCenter";
  static String settingScreen = "/setting_screen";
  static String changePasswordScreen = "/change_password_screen";
  static String eResidentCardScreen = "/e_residence_card_screen";
  static String contactUsScreen = "/contact_us_screen";

  // static String homeScreen = '/home_Screen';

  static List<GetPage> pages = [
    GetPage(
      name: registerScreen,
      page: () => RegisterWidget(),
      bindings: [RegisterBinding()],
    ),
    GetPage(
      name: registerEmailScreen,
      page: () => RegisterWithEmailWidget(),
      bindings: [RegisterWithEmailBinding()],
    ),
    GetPage(
      name: signInScreen,
      page: () => const SignInWidget(),
      bindings: [SignInBinding()],
    ),
    GetPage(
        name: forgotPasswordScreen,
        page: () => ForgotPasswordWidget(),
        bindings: [ForgotPasswordBinding()]),
    GetPage(
        name: otpVerificationScreen,
        page: () => OtpVerificationWidget(),
        bindings: [OtpVerificationBinding()]),
    GetPage(
        name: resetPasswordScreen,
        page: () => ResetPasswordWidget(),
        bindings: [ResetPasswordBinding()]),
    GetPage(
      name: dashboardScreen,
      page: () => DashboardWidget(),
      bindings: [DashboardBinding(),HomeBinding(),QrCodeBinding(),BookingBinding(),NoticeDetailsBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeWidget(),
    ),
    GetPage(
      name: qrCodeScreen,
      page: () => QrCodeWidget(),
    ),
    GetPage(
      name: bookingScreen,
      page: () => BookingWidget(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationWidget(),
    ),
    GetPage(
      name: estateInfoListScreen,
      page: () => EstateInfoWidget(),
      bindings: [EstateInfoBinding()],
    ),
    GetPage(
      name: estateFundListScreen,
      page: () => EstateFundListWidget(),
      bindings: [EstateFundListBinding()],
    ),
    GetPage(
      name: noticeDetailsScreen,
      page: () => NoticeDetailsWidget(),
      bindings: [NoticeDetailsBinding()],
    ),
    GetPage(
      name: reservationRecordsScreen,
      page: () => ReservationWidget(),
      bindings: [ReservationBinding(),PendingStatusWidgetBinding(),PastRecordsStatusBinding()],
    ),
    GetPage(
      name: bookingDetailsScreen,
      page: () => BookingDetailsWidget(),
      bindings: [BookingDetailsBinding()],
    ),
    GetPage(
      name: easyLivingInfo,
      page: () => EasyLivingInfoWidget(),
      bindings: [EasyLivingInfoBinding()],
    ),
    GetPage(
      name: easyLivingMTRCategory,
      page: () => CategoryMtrDetailsWidget(),
      bindings: [CategoryMtrDetailsBinding()],
    ), GetPage(
      name: easyLivingBusCategory,
      page: () => CategoryBusDetailsWidget(),
      bindings: [CategoryBusDetailsBinding()],
    ),
    GetPage(
      name: easyLivingBusStation,
      page: () => CategoryBusStationListWidget(),
      bindings: [CategoryBusStationBinding()],
    ),
    GetPage(
      name: easyLivingTaxi,
      page: () => CategoryTaxiDetailsWidget(),
      bindings: [CategoryTaxiDetailsBinding()],
    ),
    GetPage(
      name: easyLivingLibrary,
      page: () => CategoryLibraryDetailsWidget(),
      bindings: [CategoryLibraryDetailsBinding()],
    ),
    GetPage(
      name: easyLivingPostOffice,
      page: () => CategoryPostOfficeDetailsWidget(),
      bindings: [CategoryPostOfficeDetailsBinding()],
    ),
    GetPage(
      name: easyLivingWebMarket,
      page: () => CategoryWebMarketDetailsWidget(),
      bindings: [CategoryWebMarketDetailsBinding()],
    ),
    GetPage(
      name: easyLivingSportCenter,
      page: () => CategorySportCenterDetailsWidget(),
      bindings: [CategorySportCenterDetailsBinding()],
    ),
    GetPage(
      name: settingScreen,
      page: () => SettingPage(),
      bindings: [SettingBinding()],
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => const ChangePasswordPage(),
      bindings: [ChangePasswordBinding()],
    ),

    GetPage(
      name: eResidentCardScreen,
      page: () =>  EResidentCardPage(),
      bindings: [EResidentCardBinding()],
    ),
    GetPage(
      name: contactUsScreen,
      page: () => ContactUsWidget(),
      bindings: [ContactUsBinding()],
    ),
  ];
}
