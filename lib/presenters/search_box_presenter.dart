import 'package:be_home/config/credentials.dart';
import 'package:be_home/models/location_model.dart';
import 'package:dio/dio.dart';

Future<List<LocationModel>> search(String query) async {
  String url =
      "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$AUTO_COMPLETE_API_KEY";
  Response response = await Dio().get(url);
  return LocationModel.parseLocationList(response.data);
}
