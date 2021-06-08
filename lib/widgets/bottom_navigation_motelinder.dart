import 'package:flutter/material.dart';
import 'package:be_home/constants/color_constant.dart';

class BottomNavigationMoteliner extends StatefulWidget {
  final int selectIndex;

  const BottomNavigationMoteliner({Key key, this.selectIndex})
      : super(key: key);

  @override
  _BottomNavigationMotelinerState createState() =>
      _BottomNavigationMotelinerState();
}

class _BottomNavigationMotelinerState extends State<BottomNavigationMoteliner> {
  int _selectIndex;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectIndex = widget.selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(top: 10.0),
      height: 75.0,
      decoration: BoxDecoration(
          color: appMainColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      child: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _selectIndex == 0
                    ? Icon(Icons.home)
                    : Icon(Icons.home_outlined),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: _selectIndex == 1
                    ? Icon(Icons.date_range)
                    : Icon(Icons.date_range_outlined),
                label: 'Appointment'),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectIndex == 2 ? Icons.search : Icons.search_outlined,
                    size: 39.0),
                label: ''),
            BottomNavigationBarItem(
                icon: _selectIndex == 3
                    ? Icon(Icons.notifications)
                    : Icon(Icons.notifications_outlined),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: _selectIndex == 4
                    ? Icon(Icons.account_box)
                    : Icon(Icons.account_box_outlined),
                label: 'Account'),
          ],
          currentIndex: _selectIndex,
          unselectedItemColor: greyColor,
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          selectedFontSize: 12.0,
          showUnselectedLabels: true,
          elevation: 0.0,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (_selectIndex != index) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/search');
          break;
        default:
          Navigator.pushReplacementNamed(context, '/');
          break;
      }
      setState(() {
        _selectIndex = index;
      });
    }
  }
}
