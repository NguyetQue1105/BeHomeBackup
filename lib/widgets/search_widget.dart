import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/screens/search_action_screen.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String searchText;
  const SearchWidget({Key key, this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                color: borderColor,
                spreadRadius: 0,
                blurRadius: 5.0,
                offset: Offset(0, 3))
          ]),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchActionScreen()),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: searchText ?? "Tìm kiếm ngôi nhà thứ 2 của bạn",
                  hintStyle: TextStyle(
                    color: Colors.black.withAlpha(120),
                  ),
                  border: InputBorder.none,
                  enabled: false,
                ),
                cursorHeight: 27.0,
                onChanged: (String keyword) {},
                onTap: () {},
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Icon(Icons.search, color: Colors.black.withAlpha(120), size: 30.0),
          ],
        ),
      ),
    );
  }
}
