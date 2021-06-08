import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/constants/style_constant.dart';
import 'package:flutter/material.dart';

import 'badge_widget.dart';

class RentItemCardWidget extends StatelessWidget {
  bool isSquare;

  int area;
  String ward;
  String address;
  String distance;
  String price;
  String gender;
  String imageCover;

  RentItemCardWidget(
      {Key key,
      this.isSquare,
      this.address,
      this.area,
      this.ward,
      this.distance,
      this.price,
      this.gender,
      this.imageCover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    isSquare = isSquare ?? false;
    double itemWidth =
        MediaQuery.of(context).size.width * (isSquare ? 0.5 : 0.6);
    return Container(
      width: itemWidth,
      child: Card(
        semanticContainer: true,
        clipBehavior: isSquare ? Clip.none : Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Badge(
                child: Image.network(
                  imageCover ?? 'https://placeimg.com/640/480/arch',
                  width: itemWidth,
                  height: itemWidth * (isSquare ? 1 : 0.75),
                  fit: BoxFit.fill,
                ),
                value: distance ?? "0km",
                top: 2.0,
                right: 2.0),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        address ?? '',
                        style: rentCardTitleStyle,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(ward ?? '', style: rentCardCityStyle),
                          Text(' • ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: greyColor)),
                          Text((area ?? '').toString() + 'm2',
                              style: rentCardCityStyle),
                          Text(gender != null ? (' • ' + gender) : '',
                              style: rentCardCityStyle),
                        ],
                      ),
                      Text((price ?? "0") + " triệu/tháng",
                          style: rentCardPriceStyle),
                    ],
                  )),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
      ),
    );
  }
}
