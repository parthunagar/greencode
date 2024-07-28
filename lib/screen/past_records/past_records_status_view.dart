import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/past_records/past_records_controller.dart';
import 'package:greencode/screen/reservation/reservation_controller.dart';
import 'package:greencode/widget/data_not_found_widget.dart';


class PastRecordsStatusWidget extends GetView<PastRecordsStatusController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PastRecordsStatusController>();
    final reservationController = Get.find<ReservationController>();

    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left:w * 0.04 ,right:w * 0.04 ,top:h * 0.012 ),
        child: Obx(() {
          // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
          return reservationController.isReservationPastClubListLoad.value == true
              ? DataNotFoundWidget(title: 'data_not_found'.tr,)
              : ListView.separated(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              shrinkWrap: true,
              // itemCount: controller.driverList.value.length,// 20,
              itemCount: reservationController.reservationPastClubMutableList.value.length,
              // 20,
              separatorBuilder: (_, __) => SizedBox(height: h * 0.025),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    debugPrint('index--' + index.toString());
                    // controller.currantIndex.value = index;
                    // controller.background.value = cBlue;
                    // controller.iconColor.value = true;
                    //
                    // Get.toNamed(AppRoute.estateFundListScreen, arguments: {
                    //   NavigationArgs.navigationEstateNoticeID: controller
                    //       .estateInfoMutableList.value[index].id
                    //       .toString(),
                    // });
                    // Future.delayed(const Duration(milliseconds: 1500), () {
                    //   controller.background.value = cWhite;
                    //   controller.iconColor.value = false;
                    // });
                  },
                  child: Container(
                    height: h * 0.11,
                    decoration: BoxDecoration(
                      color: cWhite,
                      // color: controller.currantIndex.value == index
                      //     ? controller.background.value
                      //     : cWhite,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: cDivider,
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Container(
                              //   // color: Colors.red,
                              //   child: Image.network(
                              //     'https://picsum.photos/250?image=9',
                              //     width: w / 4,
                              //     height: h * 0.1,
                              //   ),
                              // )
                              CachedNetworkImage(
                                width: w * 0.25,
                                height: h * 0.11,
                                // imageUrl: index % 2 == 0 ? '' : 'https://picsum.photos/250?image=9',
                                imageUrl: reservationController.reservationPastClubMutableList.value[index].clubTitleInfo![0].clubImageInfo!.isEmpty
                                    ? ''
                                    : reservationController.reservationPastClubMutableList.value[index].clubTitleInfo![0].clubImageInfo![0].clubImageLink.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)
                                        ),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                // placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)
                                        ),

                                      ),
                                      child: SvgPicture.asset(Assets.placeHolderBanner,fit: BoxFit.fill,),
                                    ),

                              ),
                              SizedBox(width: w * 0.02,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Text(
                                      // 'dchjuaksicfgaiksudc giksuadygcfk uasdgcfikuasdgtckusgtdikfcaiskdfgcisdfgyilasdgyfilasydfilo',
                                      reservationController.reservationPastClubMutableList.value[index].clubTitleInfo![0].clubTitle.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle
                                          .textStyleLabelColorBlackLight14,
                                      textAlign: TextAlign.start,
                                    ),
                                    width: w * 0.39,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(Assets.selectDate
                                        , width: w * 0.04, height: w * 0.04,),
                                      SizedBox(width: w * 0.01,),
                                      Text(reservationController.reservationPastClubMutableList.value[index].date.toString(), style: AppStyle
                                          .textStyleLabelColorGreyLight11),
                                      SizedBox(width: w * 0.04,),
                                      SvgPicture.asset(Assets.myAccountHome,
                                        width: w * 0.04, height: w * 0.04,),
                                      SizedBox(width: w * 0.01,),
                                      Text(reservationController.reservationPastClubMutableList.value[index].adult.toString()+'-'+
                                          reservationController.reservationPastClubMutableList.value[index].child.toString()+'-'+
                                          reservationController.reservationPastClubMutableList.value[index].baby.toString(), style: AppStyle
                                          .textStyleLabelColorGreyLight11),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.selectTime, width: w * 0.04,
                                        height: w * 0.04,),
                                      SizedBox(width: w * 0.01,),
                                      Text(reservationController.reservationPastClubMutableList.value[index].time.toString(), style: AppStyle
                                          .textStyleLabelColorGreyLight11),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: h,
                            width: w *0.26,
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.03, vertical: h * 0.01),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: cLightBlack,
                              color: reservationController.reservationPastClubMutableList.value[index].status.toLowerCase() == 'completed' ? cBlueLight : cLightBlack ,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  reservationController.reservationPastClubMutableList.value[index].status.toLowerCase() == 'cancel' ? 'cancelled'.tr : 'paid'.tr,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.textStyleLabelColorWhiteHome,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        }),
      ),
    );
  }
}
