import 'package:be_home/bloc/NavigationBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/screens/appointment_screen.dart';
import 'package:be_home/screens/booking_screen.dart';
import 'package:be_home/screens/home_screen.dart';
import 'package:be_home/screens/map_picker_screen.dart';
import 'package:be_home/screens/search_action_screen.dart';
import 'package:be_home/screens/search_result_screen.dart';
import 'package:be_home/screens/setting_screen.dart';
import 'package:be_home/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isShowSeachIcon = false;

  void setShowSearchIcon(value) {
    setState(() {
      _isShowSeachIcon = value;
    });
  }

  bool _isShowSearchActionIcon = false;

  void setShowSearchActionIcon(value) {
    setState(() {
      _isShowSearchActionIcon = value;
    });
  }

  static const List<String> _widgetTitles = [
    'BeHome',
    'Tìm kiếm',
    'Lịch hẹn',
    'Cài đặt',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<NavigationBloc>(context).currentIndex;
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(setShowIcon: setShowSearchIcon),
      SearchResultScreen(setShowIcon: setShowSearchActionIcon),
      AppointmentScreen(),
      BookingScreen()
    ];

    List<Widget> _actionHome = <Widget>[
      IconButton(
        icon: Icon(
          Icons.map,
          color: appMainColor,
        ),
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MapPickerScreen()));
        },
      )
    ];

    List<Widget> _actionSearch = _isShowSearchActionIcon
        ? <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: appMainColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchActionScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list,
                color: appMainColor,
              ),
              onPressed: () {},
            ),
          ]
        : <Widget>[];

    if (_isShowSeachIcon && _actionHome.length == 1) {
      _actionHome.add(IconButton(
        icon: Icon(
          Icons.search,
          color: appMainColor,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchActionScreen()),
          );
        },
      ));
    } else if (!_isShowSeachIcon && _actionHome.length == 2) {
      _actionHome.removeAt(1);
    }

    List<List<Widget>> _listAction = [_actionHome, _actionSearch, [], []];

    return Scaffold(
        appBar: AppBar(
            title: Text(_widgetTitles[currentIndex],
                style: TextStyle(
                    color: appMainColor, fontWeight: FontWeight.bold)),
            backgroundColor: fillColor,
            bottomOpacity: 0.0,
            elevation: 0.0,
            centerTitle: true,
            actions: _listAction[currentIndex]),
        body: _widgetOptions[currentIndex],
        bottomNavigationBar: BottomNavbarWidget());
  }
}
