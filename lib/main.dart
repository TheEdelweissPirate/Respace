import 'package:flutter/material.dart';
import 'package:respace/pages/choose_location.dart';
import 'package:respace/pages/home.dart';
import 'package:respace/pages/location_map.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home' : (context) => Home(),
      '/location_map': (context) => LocationMap(),
      '/choose_location': (context) => ChooseLocation(),
    },
  ));
}

