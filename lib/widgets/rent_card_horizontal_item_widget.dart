import 'package:be_home/constants/style_constant.dart';
import 'package:flutter/material.dart';

class RentCardHorizontalItemWidget extends StatelessWidget {
  int area;
  String ward;
  String address;
  String distance;
  String price;
  String imageCover;

  RentCardHorizontalItemWidget(
      {Key key,
      this.address,
      this.area,
      this.ward,
      this.distance,
      this.price,
      this.imageCover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Card(
        semanticContainer: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Image.network(
                imageCover,
                fit: BoxFit.fill,
                height: 100.0,
                width: 100.0,
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        address,
                        style: rentCardTitleStyle,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(ward, style: rentCardCityStyle),
                      Text(distance, style: rentCardCityStyle),
                      Text(price + " triệu/tháng", style: rentCardPriceStyle),
                    ],
                  )),
            )
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
        elevation: 1.0,
      ),
    );
  }
}
