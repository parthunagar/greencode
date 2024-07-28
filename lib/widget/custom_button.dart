
import 'package:flutter/material.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';

class CustomButton extends StatefulWidget {
  String? title;
  Color? backgroundColor;
  Color? primary;
  var onPressed;
  var padding;
  var borderRadius;
  TextStyle? style;
  CustomButton({Key? key,this.title,this.backgroundColor,this.primary,this.onPressed,this.padding,this.borderRadius,this.style}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          // width: w * 0.65,
          padding: widget.padding ?? EdgeInsets.zero,
          width: w,
          height: h * 0.075,
          child: TextButton(
              onPressed: widget.onPressed ?? () {
                debugPrint(' ======> ON CLICK TEXT BUTTON <====== ');
                // resizeNotifier.value = false;
                // Get.offNamed(AppRoutes.dashBoardScreen);
              },
              style: TextButton.styleFrom(
                  primary: widget.primary ?? cWhite,
                  padding:  EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( widget.borderRadius ?? 10)),
                  backgroundColor: widget.backgroundColor ?? cBlue),
              child: Text(widget.title!, style: widget.style ?? AppStyle.textStyleFamilyAbelProCustomBtn)
          )
      ),
    );
  }
}
