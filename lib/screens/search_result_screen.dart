import 'dart:async';

import 'package:be_home/bloc/SearchBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/models/rent_item_model.dart';
import 'package:be_home/presenters/rent_item_presenter.dart';
import 'package:be_home/screens/search_action_screen.dart';
import 'package:be_home/widgets/filter_widget.dart';
import 'package:be_home/widgets/rent_result_item_widget.dart';
import 'package:be_home/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatefulWidget {
  ValueChanged<bool> setShowIcon;

  SearchResultScreen({Key key, this.setShowIcon}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  List<Widget> _listResultWidgets = [];
  ScrollController _scrollController = ScrollController();
  bool _isShowIcon = false;

  List<Widget> getSearchResultWidgets() {
    List<RentItemModel> rentItems = getSearchResult();
    List<Widget> listWidgets = rentItems
        .map((item) => RentResultItemWidget(
              address: item.address,
              area: item.area,
              distance: item.distance,
              imageCover: item.imageCover,
              price: item.price,
              gender: item.gender,
              ward: item.ward,
              tags: item.tags,
            ))
        .toList();
    return listWidgets;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 120.0 && !_isShowIcon) {
        widget.setShowIcon(true);
        setState(() {
          _isShowIcon = true;
        });
      } else if (_scrollController.position.pixels <= 120.0 && _isShowIcon) {
        widget.setShowIcon(false);
        setState(() {
          _isShowIcon = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchBloc bloc = Provider.of<SearchBloc>(context);
    if (bloc.search == null) {
      Timer.run(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchActionScreen()),
        );
      });
      return Center(child: CircularProgressIndicator());
    } else {
      _listResultWidgets = getSearchResultWidgets();
    }

    return Container(
        color: fillColor,
        child: ListView(
            physics: ClampingScrollPhysics(),
            controller: _scrollController,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SearchWidget(searchText: bloc.search.searchText),
              ),
              Padding(padding: EdgeInsets.all(10.0), child: FilterWidget()),
              ..._listResultWidgets
            ]));
  }
}
