//THIS LOCATION MAP PAGE IS A COMPLETE MESS RN. NOT USING IT AS OF NOW.
//DO NOT USE THIS PAGE ANYWHWERE
//IGNORE THIS
//THIS IS KEPT JUST FOR SAFETY


import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, 122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;



  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite:MapType.normal;
    });
  }

  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Your location',
          snippet: 'Select to choose',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Widget button(Function function, IconData icon){
    return RawMaterialButton(
      elevation: 2.0,
      shape: CircleBorder(
        side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
        ),
      ),
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      fillColor: Colors.orangeAccent,
      child: Icon(icon, size:26.0, color: Colors.yellow[200],),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          Container(
            child: RaisedButton(

              onPressed: (){
                Navigator.pushNamed(context, '/choose_location');
              },
            )
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  button(_onMapTypeButtonPressed, Icons.map_rounded),
                  SizedBox(height: 16.0,),
                  button(_onAddMarkerButtonPressed, Icons.add_location_rounded),

                ],
              ),
            ),

          )
        ],
      ),
    );


  }
}

