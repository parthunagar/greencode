import 'package:flutter/material.dart';
import 'package:greencode/constant/colors.dart';

class CustomProgressBar extends StatefulWidget {
  Color? color;
  CustomProgressBar({Key? key,this.color}) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.color ?? cBrown,
        ),
      ),
    );
  }
}
