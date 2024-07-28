
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';



class TextInputFindOut extends StatelessWidget {
    TextInputFindOut({this.label, this.iconData, this.textInputType,this.textCapitalization,this.onChange,this.controller, this.validator,
     this.inputFormatters,
     this.textInputAction});
   String? label;
   IconData? iconData;
   TextInputType? textInputType;
   var textCapitalization;
   var onChange;
   var controller;
   FormFieldValidator<String>? validator; TextInputAction? textInputAction;
   List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;


    var w = MediaQuery.of(context).size.width;
    final isPassword = textInputType == TextInputType.visiblePassword;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: cGrey, width: 2));
    final hidePasswordNotifier = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: hidePasswordNotifier,
      builder: (context, dynamic value, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          // maxLines: 1,
          // cursorHeight: h * 0.03,
          inputFormatters: inputFormatters,
          // textAlignVertical: TextAlignVertical.center,
          keyboardType: textInputType,
          textCapitalization: textCapitalization,
          obscuringCharacter: '*',
          obscureText: isPassword ? value : false,
          style: AppStyle.textStyleFamilyAbelPro,
          onChanged: onChange,
          textInputAction: textInputAction ?? TextInputAction.next,
          // textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: false,
            // isDense: true,
            // isCollapsed: true,
            focusColor: cBrown,
            errorMaxLines: 2,
            fillColor: cWhite,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: cBackgroundFormField),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: cBrown),
            ),
            errorStyle: AppStyle.textStyleFamilyAbelPro,
            contentPadding: EdgeInsets.only(top: h * 0.02,left: w * 0.04,right: w * 0.04),
            // suffixIcon: isPassword
            //     ? GestureDetector(
            //     onTap: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 8.0),
            //       child: SvgPicture.asset(
            //         value
            //             ? Assets.hidePassword
            //             : Assets.visiblePassword,
            //         // height: h * 0.005,
            //         // width: w *0.05,
            //         color: cGrey,),
            //     ))
            //     : SizedBox(),
            // suffixIconConstraints: BoxConstraints(
            //     maxHeight: h * 0.05,
            //     maxWidth: w * 0.5
            // ),
            labelText: label,
            labelStyle: AppStyle.textStyleFamilyAbelPro,
            floatingLabelStyle: AppStyle.textStyleLabelColorBlackMain,
            // focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: cGrey, width: 2)),

            hintStyle: AppStyle.textStyleFamilyAbelPro,
            // prefixIcon: iconData != null ? Icon(iconData, color: cGrey, size: 23) : SizedBox(),
          ),
        );
      },
    );
  }
}
