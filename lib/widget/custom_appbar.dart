
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  String? title;
  final leading;
  final titleStyle;
  final List<Widget>? action;
  var padding;
  var imageCenter;


  CustomAppBar({
    Key? key,
   this.title, this.leading, this.action, this.titleStyle,this.padding,this.imageCenter
  })  : preferredSize = Size.fromHeight(getVerticalSize(72)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(

          child: Image.asset(
            Assets.greenCodeTitleBg,
            fit: BoxFit.fill,
            width: w,

          ),
          color: cBrownTitle,
          width: w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ?? SizedBox(),
            imageCenter,

            Row(
              children: action ?? [],
            ),

          ],
        ),

      ],
    );
  }
}
