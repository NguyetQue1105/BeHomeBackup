import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/constants/style_constant.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: buttonStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: buttonStyle,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: appMainColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child:
        Text("Login", textAlign: TextAlign.center, style: buttonStyle),
      ),
    );
    final loginGmail = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: appMainColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child:
        Text("Login with Gmail", textAlign: TextAlign.center, style: buttonStyle),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/icons/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Text('BeHome', style: loginTitleStyle),
                const SizedBox(height: 45.0),
                emailField,
                const SizedBox(height: 25.0),
                passwordField,
                const SizedBox(height: 25.0),
                loginButon,
                const SizedBox(height: 10.0),
                Text('or', style: rentCardCityStyle),
                const SizedBox(height: 10.0),
                loginGmail,
              ],
            ),
          ),
        ),
      ),
    );
  }
}