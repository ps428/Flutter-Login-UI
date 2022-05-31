import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

void addNewMarker(List<Marker> markersList, Image img, String name,
    String description, double lat, double lng) async {
  Marker newmarker = Marker(
    width: 80.0,
    height: 80.0,
    point: latLng.LatLng(lat, lng),
    builder: (ctx) => Container(child: img),
  );

  markersList.add(newmarker);
}

MarkerLayerOptions markers(List<Image> imgList, List<String> titleList,
    List<String> descList, List<double> latList, List<double> lngList) {
  List<Marker> markerList = [];

  for (int i = 0; i < imgList.length; i++) {
    addNewMarker(markerList, imgList[i], titleList[i], descList[i], latList[i],
        lngList[i]);
  }

  MarkerLayerOptions markerOptions = MarkerLayerOptions(markers: markerList);

  return markerOptions;
}

Future<FlutterMap> generateMap(
    MapOptions options, List<LayerOptions> layer) async {
  FlutterMap map = FlutterMap(options: options, layers: layer);
  return map;
}
