
import 'package:flutter/material.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';


class CustomNewAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final String? titleFamily;
  final onTap;
  final icon;
  double? elevation;
  final leading;
  final List<Widget>? action;

  @override
  final Size preferredSize;

  CustomNewAppBar({Key? key, this.title, this.centerTitle, this.titleFamily, this.onTap, this.icon, this.elevation, this.leading, this.action})
      : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: cWhite,
      automaticallyImplyLeading: true,
      // leading: Container(margin: EdgeInsets.only(left: w * 0.03, top: h * 0.02,bottom: h * 0.02),child: leading),
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: w * 0.03,top: h * 0.02,bottom: h * 0.02),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: cWhite,// Colors.red,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(blurRadius: getHorizontalSize(5), color: Colors.black12, spreadRadius: 1)
            ],
          ),
          child: Icon(
            leading,// Icons.arrow_back_ios_rounded,
            size: getFontSize(15),
            color: Colors.black,
            // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
      ),

      leadingWidth: w * 0.1,
      titleSpacing: 0,//w * 0.025,
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? true,
      title: Text(title ?? '',textAlign: TextAlign.center, style: AppStyle.textStyleFamilyAbelProBold),
      actions: action ?? [],
    );
  }
}