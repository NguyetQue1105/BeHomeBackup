import 'package:be_home/bloc/LocationBloc.dart';
import 'package:be_home/constants/color_constant.dart';
import 'package:be_home/widgets/map_picker_widget.dart';
import 'package:be_home/widgets/search_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapPickerScreen extends StatelessWidget {
  const MapPickerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: MapPickerBody(),
    ));
  }
}

class MapPickerBody extends StatelessWidget {
  const MapPickerBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationBloc>(
      builder: (context, bloc, child) => Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                MapPickerWidget(bloc),
                Container(
                  padding: EdgeInsets.only(right: 10.0, top: 10.0),
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
                        child: SearchBox(bloc),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationBloc locationBloc = Provider.of<LocationBloc>(context);
    return Container(
      height: 90,
      width: double.infinity,
      // color: Colors.blue[50],
      child: FractionallySizedBox(
        widthFactor: 0.7,
        heightFactor: 0.5,
        child: RaisedButton(
          color: appMainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            Navigator.pop(context, locationBloc.currentLocation);
          },
          child: Text(
            "Chọn",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
