import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/constants/style_constant.dart';
import 'package:be_home/widgets/tag_item_widget.dart';
import 'package:flutter/material.dart';

class RentResultItemWidget extends StatelessWidget {
  int area;
  String ward;
  String address;
  String distance;
  String price;
  String gender;
  String imageCover;
  List<String> tags;

  RentResultItemWidget(
      {Key key,
      this.address,
      this.area,
      this.ward,
      this.distance,
      this.price,
      this.gender,
      this.imageCover,
      this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      child: Column(
        children: [
          SizedBox(
              height: 8.0,
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                  decoration: const BoxDecoration(color: borderColor))),
          Expanded(
            child: Card(
              semanticContainer: true,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            Text(distance, style: rentCardCityStyle),
                            Container(
                              height: 35.0,
                              child: ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tags.length,
                                  itemBuilder: (context, index) =>
                                      TagItemWidget(childItem: Text(tags[index]))),
                            ),
                            Text(price + " triệu/tháng", style: rentCardPriceStyle),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Image.network(
                      imageCover,
                      fit: BoxFit.fill,
                      height: 150.0,
                      width: 150.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
