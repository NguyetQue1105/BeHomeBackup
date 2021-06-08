import 'package:be_home/constants/color_constant.dart';
import 'package:flutter/material.dart';

class MoreButtonCardWidget extends StatelessWidget {

  const MoreButtonCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      child: GestureDetector(
        child: Card(
            elevation: 0,
            child: Center(
                child: MaterialButton(
              onPressed: () {},
              color: backgroundColor,
              textColor: Colors.black,
              child: Icon(
                Icons.arrow_forward,
                size: 24,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ))),
      ),
    );
  }
}
