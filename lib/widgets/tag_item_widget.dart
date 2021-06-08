import 'package:be_home/constants/color_constant.dart';
import 'package:flutter/material.dart';

class TagItemWidget extends StatelessWidget {
  Widget childItem;

  TagItemWidget({@required this.childItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: tagColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(child: childItem),
      ),
    );
  }
}
