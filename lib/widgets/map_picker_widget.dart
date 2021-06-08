import 'dart:async';

import 'package:be_home/bloc/LocationBloc.dart';
import 'package:be_home/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerWidget extends StatefulWidget {
  final LocationBloc bloc;

  MapPickerWidget(this.bloc);

  @override
  _MapPickerWidgetState createState() => _MapPickerWidgetState();
}

class _MapPickerWidgetState extends State<MapPickerWidget> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _target;

  @override
  void initState() {
    super.initState();
    _target = widget.bloc.currentLocation != null
        ? LatLng(
            widget.bloc.currentLocation.lat, widget.bloc.currentLocation.lng)
        : LatLng(10.842037838767828, 106.80931989714418);
    widget.bloc.locationController.stream.listen((location) async {
      GoogleMapController mapController = await _controller.future;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              location.lat,
              location.lng,
            ),
            zoom: 15.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: _target,
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMove: (CameraPosition newPosition) async {
                  widget.bloc.setLocationByMovingMap(LocationModel(
                      lat: newPosition.target.latitude,
                      lng: newPosition.target.longitude));
                },
              ),
              Center(
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
