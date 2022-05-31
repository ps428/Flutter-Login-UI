import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:maps_utils/utilities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps Utilities',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Maps Utilities app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var center = latLng.LatLng(26.3, 73.0);
  late FlutterMap map;
  bool mapMade = false;

  @override
  void initState() {
    // TODO: implement initState
    makeMap();
    super.initState();
  }

  Future<void> makeMap() async {
    Image defaultImg = Image.asset(
      'assets/flagRed.png',
      height: 40,
    );

    Image flagIndia = Image.asset(
      'assets/flagIndia.png',
      height: 40,
    );

    Image flagChina = Image.asset(
      'assets/flagChina.png',
      height: 40,
    );

    List<Image> imgList = [defaultImg, flagIndia, flagChina];
    List<String> titleList = ["Default Flag", "Indian Flag", "Chinese Flag"];
    List<String> descList = [
      "Default flag here",
      "Indian flag here",
      "Chinese flag here"
    ];
    List<double> latList = [26.31, 26.35, 26.27];
    List<double> lngList = [73.0, 73.05, 73.1];

    MapOptions options = MapOptions(
      center: center,
      zoom: 12.0,
    );

    List<LayerOptions> layer = [
      TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c']),
      markers(imgList, titleList, descList, latList, lngList)
      // markers(),
    ];

    FlutterMap newMap = await generateMap(options, layer);

    setState(() {
      mapMade = true;
      map = newMap;
    });
    // call generate map function
    // update the generated map in the other file
    // return the updated map
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Center(child: mapMade ? map : const Text("Loading map")),
    ));
  }
}
