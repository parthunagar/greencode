
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greencode/constant/app_image.dart';
import 'package:greencode/constant/appstyle.dart';
import 'package:greencode/constant/colors.dart';



class TextFormFieldOutput extends StatelessWidget {
  TextFormFieldOutput({this.label, this.iconData, this.textInputType,this.textCapitalization,this.onChange,this.controller, this.validator,
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
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: cBackgroundFormField, width: 1));
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
          style: AppStyle.textStyleLabelColorBlack,
          onChanged: onChange,
          textInputAction: textInputAction ?? TextInputAction.next,

          // textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            // isDense: true,
            // isCollapsed: true,
            errorMaxLines: 2,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorStyle: AppStyle.textStyleLabelColorBlack,
            focusColor: cBrown,
            fillColor: cWhite,
            // suffixIcon: isPassword
            //     ? IconButton(
            //     onPressed: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
            //     icon: Icon(
            //       value ? Icons.visibility : Icons.visibility_off,
            //       color: cGrey,))
            //     : null,

            suffixIcon: isPassword
                ? GestureDetector(
                onTap: () => hidePasswordNotifier.value = !hidePasswordNotifier.value,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    value
                        ? Assets.hidePassword
                        : Assets.visiblePassword,
                    // height: h * 0.005,
                    // width: w *0.05,
                    color: cGrey,),
                ))
                : SizedBox(),
            suffixIconConstraints: BoxConstraints(
              maxHeight: h * 0.05,
              maxWidth: w * 0.5
            ),
            enabledBorder: outlineInputBorder,
            hintText: label,

            // focusedBorder: outlineInputBorder.copyWith(borderSide: BorderSide(color: cGrey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: cBrown)),
            // prefixIcon: iconData != null ? Icon(iconData, color: cGrey, size: 23) : SizedBox(),
          ),
        );
      },
    );
  }
}
