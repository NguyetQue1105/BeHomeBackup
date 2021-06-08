import 'package:be_home/constants/color_constant.dart';
import 'package:flutter/material.dart';

class FilterItemWidget extends StatelessWidget {
  Widget childItem;

  FilterItemWidget({@required this.childItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5.0, 15, 5.0),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(15)),
        child: Center(child: childItem));
  }
}
