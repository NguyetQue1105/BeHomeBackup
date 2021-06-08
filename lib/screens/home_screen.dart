import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/constants/style_constant.dart';
import 'package:be_home/models/rent_item_model.dart';
import 'package:be_home/presenters/rent_item_presenter.dart';
import 'package:be_home/widgets/more_button_card.dart';
import 'package:be_home/widgets/rent_card_horizontal_item_widget.dart';
import 'package:be_home/widgets/rent_card_item_widget.dart';
import 'package:be_home/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> setShowIcon;

  const HomeScreen({Key key, this.setShowIcon}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = new ScrollController();

  bool _isShowIcon = false;

  List<Widget> _listNearByWidgets = [];
  List<Widget> _listNewWidgets = [];
  List<Widget> _listSharingWidget = [];
  List<Widget> _listOtherWidget = [];

  List<Widget> getListNearByItemWidgets() {
    List<RentItemModel> rentItems = getNearByRentItems();
    List<Widget> listWidgets = rentItems
        .map((item) => RentItemCardWidget(
              isSquare: true,
              address: item.address,
              area: item.area,
              distance: item.distance,
              imageCover: item.imageCover,
              price: item.price,
              ward: item.ward,
            ))
        .toList();
    if (listWidgets.length >= 2) {
      listWidgets = [...listWidgets, MoreButtonCardWidget()];
    }
    return listWidgets;
  }

  List<Widget> getListNewItemWidgets() {
    List<RentItemModel> rentItems = getNewRentItems();
    List<Widget> listWidgets = rentItems
        .map((item) => RentItemCardWidget(
              isSquare: true,
              address: item.address,
              area: item.area,
              distance: item.distance,
              imageCover: item.imageCover,
              price: item.price,
              ward: item.ward,
            ))
        .toList();
    if (listWidgets.length >= 2) {
      listWidgets = [...listWidgets, MoreButtonCardWidget()];
    }
    return listWidgets;
  }

  List<Widget> getListSharingItemWidgets() {
    List<RentItemModel> rentItems = getSharingRentItems();
    List<Widget> listWidgets = rentItems
        .map((item) => RentItemCardWidget(
              address: item.address,
              area: item.area,
              distance: item.distance,
              imageCover: item.imageCover,
              price: item.price,
              gender: item.gender,
              ward: item.ward,
            ))
        .toList();
    if (listWidgets.length >= 2) {
      listWidgets = [...listWidgets, MoreButtonCardWidget()];
    }
    return listWidgets;
  }

  List<Widget> getListOtherRentItemWidgets() {
    List<RentItemModel> rentItems = getOtherRentItems();
    List<Widget> listWidgets = rentItems
        .map((item) => RentCardHorizontalItemWidget(
              address: item.address,
              area: item.area,
              distance: item.distance,
              imageCover: item.imageCover,
              price: item.price,
              ward: item.ward,
            ))
        .toList();
    return listWidgets;
  }

  @override
  void initState() {
    super.initState();
    _listNearByWidgets = getListNearByItemWidgets();
    _listNewWidgets = getListNewItemWidgets();
    _listSharingWidget = getListSharingItemWidgets();
    _listOtherWidget = getListOtherRentItemWidgets();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 80.0 && !_isShowIcon) {
        widget.setShowIcon(true);
        setState(() {
          _isShowIcon = true;
        });
      } else if (_scrollController.position.pixels <= 80.0 && _isShowIcon) {
        widget.setShowIcon(false);
        setState(() {
          _isShowIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: fillColor,
      child: ListView(
          physics: ClampingScrollPhysics(),
          controller: _scrollController,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchWidget(),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Nearby hostel
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nhà trọ gần bạn 🎯", style: homeTitleStyle),
                        Text("Xem thêm →", style: viewMoreText)
                      ],
                    ),
                  ),
                  Container(
                      height: 300.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _listNearByWidgets,
                      )),
                  SizedBox(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                          decoration: const BoxDecoration(color: borderColor))),
                  // New hostel
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nhà trọ mới nhất ✨", style: homeTitleStyle),
                        Text("Xem thêm →", style: viewMoreText),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      height: 300.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _listNewWidgets,
                      )),
                  SizedBox(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                          decoration: const BoxDecoration(color: borderColor))),
                  // Recommend hostel
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gợi ý ghép phòng", style: homeTitleStyle),
                          Text("Xem thêm →", style: viewMoreText),
                        ]),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      height: 275.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _listSharingWidget,
                      )),
                  SizedBox(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                          decoration: const BoxDecoration(color: borderColor))),
                  // More hostel
                  Container(
                    color: borderColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                              Text("Các nhà trọ khác", style: homeTitleStyle),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            child: Column(
                          children: _listOtherWidget,
                        )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
