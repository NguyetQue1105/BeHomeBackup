import 'package:be_home/bloc/LocationBloc.dart';
import 'package:be_home/bloc/NavigationBloc.dart';
import 'package:be_home/bloc/SearchBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LocationBloc>(
        create: (context) => LocationBloc.getInstance()),
    ChangeNotifierProvider<NavigationBloc>(
        create: (context) => NavigationBloc.getInstance()),
    ChangeNotifierProvider<SearchBloc>(
        create: (context) => SearchBloc.getInstance()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Be Home',
        theme: ThemeData(
            fontFamily: 'Roboto',
            accentColor: appMainColor,
            primaryColor: appMainColor),
        home: App());
  }
}
