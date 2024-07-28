import 'package:flutter/material.dart';
import 'package:greencode/constant/appstyle.dart';


class DataNotFoundWidget extends StatefulWidget {

  String title;
  DataNotFoundWidget({Key? key,required this.title}) : super(key: key);

  @override
  _DataNotFoundWidgetState createState() => _DataNotFoundWidgetState();
}

class _DataNotFoundWidgetState extends State<DataNotFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.title,style: AppStyle.textStyleLabelColorBlackTitle,
    textAlign: TextAlign.center,),);
  }
}
