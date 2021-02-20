import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sos_hanoi/src/resources/widgets/OptionPickup.dart';
import 'package:sos_hanoi/src/resources/widgets/home_menu.dart';
import 'package:sos_hanoi/src/resources/widgets/ride_picker.dart';
import 'package:sos_hanoi/src/model/place_item_res.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _tripDistance = 0;
  PlaceItemRes _placeItemRes;
  final Map<String, Marker> _markers = <String, Marker>{};
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(21.0055178, 105.7971422),
                  zoom: 14.4746,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "SOS Hà Nội",
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: FlatButton(
                        onPressed: () {
                          print("click menu");
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset("ic_menu.png")),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: (){
                          
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker(onPlaceSelected),
                  )
                ],
              ),
            ),
            Positioned(left: 20, right: 20, bottom: 40,
              height: 248,
              child: OptionPickup(_tripDistance,_placeItemRes),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }

 void onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    var mkId = fromAddress? "from_address":"null";
    _addMarker(mkId, place);
    _moveCamera();
  }
void _addMarker(String mkId, PlaceItemRes place) async {
      //remove old
  _markers.remove(mkId);
  _mapController.clearMarkers();

  _markers[mkId] = Marker(
      mkId,
      MarkerOptions(
          position: LatLng(place.lat, place.lng),
          infoWindowText: InfoWindowText(place.name, place.address)));

  for (var m in _markers.values) {
    await _mapController.addMarker(m.options);
  }
  }

void _moveCamera() {
    print("move camera: ");
    print(_markers);
    if (_markers.values.length > 1) {
      var fromLatLng = _markers["from_address"].options.position;
      var toLatLng = _markers[""].options.position;

      var sLat, sLng, nLat, nLng;
      if(fromLatLng.latitude <= toLatLng.latitude) {
        sLat = fromLatLng.latitude;
        nLat = toLatLng.latitude;
      } else {
        sLat = toLatLng.latitude;
        nLat = fromLatLng.latitude;
      }

      if(fromLatLng.longitude <= toLatLng.longitude) {
        sLng = fromLatLng.longitude;
        nLng = toLatLng.longitude;
      } else {
        sLng = toLatLng.longitude;
        nLng = fromLatLng.longitude;
      }

      LatLngBounds bounds = LatLngBounds(northeast: LatLng(nLat, nLng), southwest: LatLng(sLat, sLng));
      _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    } else {
      _mapController.animateCamera(CameraUpdate.newLatLng(
          _markers.values.elementAt(0).options.position));
    }
  }
}
