import 'package:be_home/bloc/LocationBloc.dart';
import 'package:be_home/models/location_model.dart';
import 'package:be_home/presenters/search_box_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBox extends StatefulWidget {
  final LocationBloc bloc;

  SearchBox(this.bloc);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tìm kiếm địa điểm',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),
        noItemsFoundBuilder: (context) => SizedBox.shrink(),
        suggestionsCallback: (pattern) async {
          return await search(pattern);
        },
        itemBuilder: (BuildContext context, LocationModel location) {
          return Container(
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.redAccent,
              ),
              title: Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Text(
                  location.name,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              subtitle: Text(location.formattedAddress),
            ),
          );
        },
        onSuggestionSelected: (LocationModel location) {
          widget.bloc.locationSelected(location);
        },
      ),
    );
  }
}
