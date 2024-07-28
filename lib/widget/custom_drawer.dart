import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/app_route/app_route.dart';
import 'package:greencode/constant/app_constant.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/dashboard/dashboard_controller.dart';
import 'package:greencode/utils/preference.dart';

class CustomDrawer extends StatefulWidget {
  DrawerCallback? callback;

  CustomDrawer({
    this.callback,
    Key? key,
  }) : super(key: key);
  bool _isDrawerOpen = false;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    if (widget.callback != null) {
      widget.callback!(true);
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.callback != null) {
      widget.callback!(false);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final dashboardcontroller = Get.find<DashboardController>();

    return Container(
      width: w * 0.4,
      child: Drawer(
        backgroundColor: cTransparent,
        key: widget.key,
        elevation: 0,
        child: Container(
          width: w * 0.4,
          margin: EdgeInsets.only(top: h * 0.123),
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  //offset: Offset(0, 4),
                  color: cGreyLight,
                  blurRadius: 2,
                  offset: const Offset(0.0, 2.0),
                  blurStyle: BlurStyle.outer),
            ],
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint(' ======> ON CLICK MY ACCOUNT <======');
                  Get.back();
                  Get.toNamed(AppRoute.settingScreen);
                },
                child: Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          //offset: Offset(0, 4),
                          color: cGreyLight,
                          blurRadius: 2,
                          offset: const Offset(0.0, 0.0),
                          blurStyle: BlurStyle.outer),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.myAccountDrawer,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                        child: Text(
                          'my_account_home'.tr,
                          style: AppStyle.textStyleLabelColorWhiteDrawer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: cGreyLight,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint(' ======> ON CLICK ERESEDENT CARD <======');
                  Get.back();
                  Get.toNamed(AppRoute.eResidentCardScreen);
                },
                child: Container(
                  width: w,
                  color: cWhite,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          Assets.eResidentCardHome,
                          fit: BoxFit.fill,
                          color: cBlack,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                        child: Text(
                          'ereseident_card'.tr,
                          style: AppStyle.textStyleLabelColorBlackDrawer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Divider(
                  color: cGreyLight,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoute.settingScreen);
                },
                child: Container(
                  width: w,
                  color: cWhite,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          Assets.settingDrawer,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                        child: Text(
                          'setting'.tr,
                          style: AppStyle.textStyleLabelColorBrownDrawer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Divider(
                  thickness: 2,
                  color: cBrown,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(AppRoute.contactUsScreen);
                },
                child: Container(
                  width: w,
                  color: cWhite,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 12.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          Assets.callDrawer,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                        child: Text(
                          'call_us'.tr,
                          style: AppStyle.textStyleLabelColorBlackDrawer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Divider(
                  color: cGreyLight,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  var token = await Preference().read(Const.prefFCMToken);
                  debugPrint('token => $token');
                  dashboardcontroller.callLogOutApi();
                },
                child: Container(
                    width: w,
                    color: cRed,
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 10.0, left: 10.0),
                    child: Center(
                      child: Text(
                        'logOut'.tr,
                        style: AppStyle.textStyleLabelColorWhiteHome,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CustomDrawer extends StatelessWidget {
//   DrawerCallback? callback;
//   CustomDrawer({
//     this.callback,
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     final dashboardcontroller = Get.find<DashboardController>();
//
//     return Drawer(
//       backgroundColor: cTransparent,
//
//       elevation: 0,
//       child: Container(
//         width: w,
//         margin: EdgeInsets.only(top: 100, left: w * 0.5),
//         decoration: BoxDecoration(
//           color: cWhite,
//           borderRadius: BorderRadius.only(topLeft: const Radius.circular(15)),
//           boxShadow: [
//             BoxShadow(
//                 //offset: Offset(0, 4),
//                 color: cGreyLight,
//                 blurRadius: 2,
//                 offset: const Offset(0.0, 2.0),
//                 blurStyle: BlurStyle.outer),
//           ],
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: w,
//
//               decoration: BoxDecoration(
//                 color: cBlue,
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15)
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     //offset: Offset(0, 4),
//                       color: cGreyLight,
//                       blurRadius: 2,
//                       offset: const Offset(0.0, 0.0),
//                       blurStyle: BlurStyle.outer),
//                 ],
//               ),
//               padding: const EdgeInsets.only(top: 12.0),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     Assets.myAccountDrawer,
//                     fit: BoxFit.fill,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12.0,bottom: 10.0),
//                     child: Text(
//                       'My Account',
//                       style: AppStyle.textStyleLabelColorWhiteDrawer,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Divider(
//                 height: 2,
//                 color: cGreyLight,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 12.0),
//               decoration: const BoxDecoration(shape: BoxShape.circle),
//               child: SvgPicture.asset(
//                 Assets.eResidentCardHome,
//                 fit: BoxFit.fill,
//                 color: cBlack,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12.0,bottom: 10.0),
//               child: Text(
//                 'eReseident Card',
//                 style: AppStyle.textStyleLabelColorBlackDrawer,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//               child: Divider(
//                 color: cGreyLight,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 12.0),
//               decoration: const BoxDecoration(shape: BoxShape.circle),
//               child: SvgPicture.asset(
//                 Assets.settingDrawer,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 12.0,bottom: 10.0),
//               child: Text(
//                 'Setting',
//                 style: AppStyle.textStyleLabelColorBrownDrawer,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//               child: Divider(
//                 thickness: 2,
//                 color: cBrown,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(top: 12.0,bottom: 10.0),
//               decoration: const BoxDecoration(shape: BoxShape.circle),
//               child: SvgPicture.asset(
//                 Assets.callDrawer,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: Text(
//                 'Call Us',
//                 style: AppStyle.textStyleLabelColorBlackDrawer,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//               child: Divider(
//                 color: cGreyLight,
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () async {
//                 var token = await Preference().read(Const.prefFCMToken);
//                 debugPrint('token => $token');
//                 dashboardcontroller.callLogOutApi();
//               },
//               child: Container(
//                   width: w,
//                   color: cRed,
//                   padding: const EdgeInsets.only(
//                       top: 15.0, bottom: 15.0, right: 10.0, left: 10.0),
//                   child: Center(
//                     child: Text(
//                       'LogOut',
//                       style: AppStyle.textStyleLabelColorWhiteHome,
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
