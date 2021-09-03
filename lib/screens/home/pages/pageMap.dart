import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:latlong/latlong.dart';

class PageMap extends StatefulWidget {
  @override
  _PageMapState createState() => _PageMapState();
}

class _PageMapState extends State<PageMap> {

  var locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
    print(lastPosition);

    setState(() {
      locationMessage = "$position.latitude, $position.longitude";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 46.0,
              color: Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Get User Location",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Position : $locationMessage"),
            FlatButton(
              onPressed: () {
                getCurrentLocation();
              },
              color: Colors.blue[800],
              child: Text("Get Current Locatino", 
                  style: TextStyle(
                    color: Colors.white,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
    /*return FlutterMap(
      options: MapOptions(
        center: LatLng(2.93, -75.28),
        zoom: 12.8,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/juanortiz21/ckt1zkzkt1fx417o7kpe6pn0w/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoianVhbm9ydGl6MjEiLCJhIjoiY2t0MXkwOG1nMGp3bjJxbjJyZnl1bjBsOCJ9.vFSjhdkXp0Y3BHvqE1wC7w",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoianVhbm9ydGl6MjEiLCJhIjoiY2t0MXkwOG1nMGp3bjJxbjJyZnl1bjBsOCJ9.vFSjhdkXp0Y3BHvqE1wC7w',
              'id': 'mapbox.mapbox-streets-v8'
            }),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: LatLng(2.93, -75.28),
              builder: (ctx) => Container(
                child: FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );*/
  }
}
