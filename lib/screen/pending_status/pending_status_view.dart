import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';
import 'package:greencode/screen/pending_status/pending_status_controller.dart';
import 'package:greencode/screen/reservation/reservation_controller.dart';
import 'package:greencode/widget/customDialog.dart';
import 'package:greencode/widget/data_not_found_widget.dart';

class PendingStatusWidget extends GetView<PendingStatusController> {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PendingStatusController>();
    final reservationController = Get.find<ReservationController>();

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left:w * 0.04 ,right:w * 0.04 ,top:h * 0.012 ),
        child: Obx(() {
          // debugPrint('controller.estateInfoMutableList.value.length  :${controller.estateInfoMutableList.value.length}');
          return reservationController.isReservationPendingClubListLoad.value == true
              ? DataNotFoundWidget(title: 'data_not_found'.tr,)
              : ListView.separated(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  shrinkWrap: true,
                  itemCount: reservationController.reservationPendingClubMutableList.value.length,
                  // 20,
                  separatorBuilder: (_, __) => SizedBox(height: h * 0.025),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        debugPrint('index--' + index.toString());
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
                                  CachedNetworkImage(
                                    width: w * 0.25,
                                    height: h * 0.11,
                                    // imageUrl: index % 2 == 0 ? '' : 'https://picsum.photos/250?image=9',
                                    imageUrl: reservationController.reservationPendingClubMutableList.value[index].clubTitleInfo![0].clubImageInfo!.isEmpty
                                        ? ''
                                        : reservationController.reservationPendingClubMutableList.value[index].clubTitleInfo![0].clubImageInfo![0].clubImageLink.toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    // placeholder: (context, url) => const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),

                                        // image: DecorationImage(
                                        //     image: AssetImage(
                                        //         Assets.placeHolderBanner),
                                        //     fit: BoxFit.fill),
                                      ),
                                          child: SvgPicture.asset(Assets.placeHolderBanner,fit: BoxFit.fill,),
                                    ),
                                  ),
                                  SizedBox(
                                    width: w * 0.02,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          // 'dchjuaksicfgaiksudc giksuadygcfk uasdgcfikuasdgtckusgtdikfcaiskdfgcisdfgyilasdgyfilasydfilo',
                                          reservationController.reservationPendingClubMutableList.value[index].clubTitleInfo![0].clubTitle.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyle
                                              .textStyleLabelColorBlackLight14,
                                          textAlign: TextAlign.start,
                                        ),
                                        width: w * 0.44,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            Assets.selectDate,
                                            width: w * 0.04,
                                            height: w * 0.04,
                                          ),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          Text(reservationController.reservationPendingClubMutableList.value[index].date.toString(),
                                              style: AppStyle
                                                  .textStyleLabelColorGreyLight11,
                                          textAlign: TextAlign.center,),
                                          SizedBox(
                                            width: w * 0.04,
                                          ),
                                          SvgPicture.asset(
                                            Assets.myAccountHome,
                                            width: w * 0.04,
                                            height: w * 0.04,
                                          ),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          Text(reservationController.reservationPendingClubMutableList.value[index].adult.toString()+'-'+
                                              reservationController.reservationPendingClubMutableList.value[index].child.toString()+'-'+
                                              reservationController.reservationPendingClubMutableList.value[index].baby.toString(),
                                              style: AppStyle
                                                  .textStyleLabelColorGreyLight11),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Assets.selectTime,
                                            width: w * 0.04,
                                            height: w * 0.04,
                                          ),
                                          SizedBox(
                                            width: w * 0.01,
                                          ),
                                          Text(reservationController.reservationPendingClubMutableList.value[index].time.toString(),
                                              style: AppStyle
                                                  .textStyleLabelColorGreyLight11),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('pay_before'.tr+' '+reservationController.reservationPendingClubMutableList.value[index].paymentDate.toString(),
                                              style: AppStyle
                                                  .textStyleLabelColorRedLight11),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: h,
                                width: w *0.21,
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.01),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: cLightBlack,
                                  // color: index % 2 == 0 ? Colors.blue : Colors.red,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        dialogCancel(
                                          context,
                                          'cancel_booking_title'.tr,
                                          'select_date_valid'.tr,
                                            reservationController.reservationPendingClubMutableList.value[index].date,
                                          'select_time_valid'.tr,
                                          reservationController.reservationPendingClubMutableList.value[index].time,
                                          'select_pax_valid'.tr,
                                          reservationController.reservationPendingClubMutableList.value[index].adult.toString()+'-'+
                                            reservationController.reservationPendingClubMutableList.value[index].child.toString()+'-'+
                                            reservationController.reservationPendingClubMutableList.value[index].baby.toString(),
                                          'back_dialog'.tr,
                                          'cancel_dialog'.tr,
                                          "",
                                          () {
                                            Get.back();
                                          },
                                          () {
                                            Get.back();
                                            controller.callCancelBooking(
                                              reservationController.reservationPendingClubMutableList.value[index].id
                                            );

                                          },
                                        );
                                      },
                                      child: Text(
                                        'cancel_dialog'.tr,
                                        textAlign: TextAlign.center,
                                        style: AppStyle
                                            .textStyleLabelColorWhiteHome,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.01,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'booking'.tr,
                                        textAlign: TextAlign.center,
                                        style: AppStyle
                                            .textStyleLabelColorWhiteHome,
                                      ),
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
