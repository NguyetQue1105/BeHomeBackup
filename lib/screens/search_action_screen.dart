import 'dart:async';

import 'package:be_home/bloc/NavigationBloc.dart';
import 'package:be_home/bloc/SearchBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/widgets/divider_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchActionScreen extends StatefulWidget {
  const SearchActionScreen({Key key}) : super(key: key);

  @override
  _SearchActionScreenState createState() => _SearchActionScreenState();
}

class _SearchActionScreenState extends State<SearchActionScreen> {
  List<String> _searchList = [];

  final List<String> _sugesstionList = [
    "Nhà trọ giá rẻ",
    "Nhà trọ quận 9",
    "Ghép trọ",
    "Đại học FPT",
    "Đại học FPT",
    "Đại học FPT",
    "Đại học FPT",
  ];

  Timer _throttle;

  TextEditingController _searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchList = _sugesstionList;
    _searchController.addListener(onSearchChanged);
  }

  void onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _searchList = _sugesstionList
              .where((text) => text
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavigationBloc navBloc = Provider.of<NavigationBloc>(context);
    SearchBloc searchBloc = Provider.of<SearchBloc>(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: fillColor,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, bottom: 30.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: fillColor,
                        textColor: Colors.black,
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 20.0,
                        ),
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        shape: CircleBorder(),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: borderColor,
                                    spreadRadius: 0,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3))
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  autofocus: true,
                                  cursorColor: appMainColor,
                                  decoration: InputDecoration(
                                    hintText: "Tìm kiếm nhà trọ",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withAlpha(120),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  cursorHeight: 27.0,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Icon(Icons.search,
                                  color: appMainColor, size: 30.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: new DividerWithText(
                  dividerText: "Gợi ý",
                ),
              ),
              Expanded(
                child: Wrap(
                  children: Iterable<int>.generate(_searchList.length)
                      .toList()
                      .map((index) =>
                          buildSugesstionCard(index, searchBloc, navBloc))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildSugesstionCard(
      int index, SearchBloc searchBloc, NavigationBloc navBloc) {
    return Hero(
      tag: "SelectedData-${_searchList[index]}-$index",
      transitionOnUserGestures: true,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Card(
            child: InkWell(
              onTap: () {
                searchBloc.setSearchTextWithoutNotify(_searchList[index]);
                navBloc.setTabIndex(1);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _searchList[index],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
