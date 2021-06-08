import 'package:be_home/bloc/NavigationBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBloc>(builder: (context, bloc, child) {
      int selectIndex = bloc.currentIndex;
      return Container(
        padding: new EdgeInsets.only(top: 5.0),
        height: 60.0,
        decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 5))
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0))),
        child: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: selectIndex == 0
                      ? Icon(Icons.home)
                      : Icon(Icons.home_outlined),
                  label: 'Trang chủ'),
              BottomNavigationBarItem(
                  icon: Icon(
                      selectIndex == 1 ? Icons.search : Icons.search_outlined),
                  label: 'Tìm kiếm'),
              BottomNavigationBarItem(
                  icon: selectIndex == 2
                      ? Icon(Icons.date_range)
                      : Icon(Icons.date_range_outlined),
                  label: 'Lịch hẹn'),
              BottomNavigationBarItem(
                  icon: selectIndex == 3
                      ? Icon(Icons.settings_applications)
                      : Icon(Icons.settings_applications_outlined),
                  label: 'Cài đặt'),
            ],
            unselectedItemColor: greyColor,
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => bloc.setTabIndex(index),
            selectedFontSize: 14.0,
            showUnselectedLabels: false,
            elevation: 0.0,
            currentIndex: selectIndex,
          ),
        ),
      );
    });
  }
}
