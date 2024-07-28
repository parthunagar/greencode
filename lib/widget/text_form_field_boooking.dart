
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';



class TextFormFieldBooking extends StatelessWidget {
  TextFormFieldBooking({this.label, this.iconData, this.textInputType,this.onChange,this.controller, this.validator,
     this.inputFormatters,
     this.textInputAction,this.readOnly,this.onTap});
   String? label;
   IconData? iconData;
   TextInputType? textInputType;
   var onChange;
   var onTap;
   var controller;
   bool? readOnly;
   FormFieldValidator<String>? validator; TextInputAction? textInputAction;
   List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;


    var w = MediaQuery.of(context).size.width;
    final isNumber = textInputType == TextInputType.number;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: cDivider, width: 1));
    final hidePasswordNotifier = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: hidePasswordNotifier,
      builder: (context, dynamic value, child) {
        return TextFormField(
          onTap: onTap,
          controller: controller,
          validator: validator,
          // maxLines: 1,
          // cursorHeight: h * 0.03,
          inputFormatters: inputFormatters,
          // textAlignVertical: TextAlignVertical.center,

          keyboardType: textInputType,
          // obscuringCharacter: '*',
          // obscureText: isNumber ? value : false,
          style: AppStyle.textStyleLabelColorBlack,
          onChanged: onChange,
          textInputAction: textInputAction ?? TextInputAction.next,
          readOnly: readOnly ?? false,
          // textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: w * 0.02),
            // isDense: true,
            // isCollapsed: true,
            errorMaxLines: 2,

            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: AppStyle.textStyleLabelColorBlack,
            focusColor: cDivider,
            fillColor: cWhite,
            // suffixIcon: isPassword
            //     ? IconButton(
            //     onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
            //     icon: Icon(
            //       value ? Icons.visibility : Icons.visibility_off,
            //       color: cGrey,))
            //     : null,

            suffixIcon: isNumber
                ? GestureDetector(
                onTap: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    Assets.downArrow,),
                ))
                : SizedBox(),
            suffixIconConstraints: BoxConstraints(
              maxHeight: h * 0.05,
              maxWidth: w * 0.5
            ),
            enabledBorder: outlineInputBorder,
            hintText: label,
            hintStyle: AppStyle.textStyleLabelColorBlack,

            // focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: cGrey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: cDivider)),
            // prefixIcon: iconData != null ? Icon(iconData, color: cGrey, size: 23) : SizedBox(),
          ),
        );
      },
    );
  }
}
