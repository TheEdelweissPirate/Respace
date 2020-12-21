import 'package:flutter/material.dart';
import 'package:respace/pages/add_post.dart';
import 'package:respace/pages/add_user_details.dart';
import 'package:respace/pages/authenticate/authenticate.dart';
import 'package:respace/pages/authenticate/login.dart';
import 'package:respace/pages/authenticate/signup.dart';
import 'package:respace/pages/business_card.dart';
import 'package:respace/pages/choose_location.dart';

import 'package:respace/pages/home.dart';
import 'package:respace/pages/location_map.dart';
import 'package:respace/pages/profile.dart';
import 'package:respace/pages/search_result_list.dart';
import 'package:respace/pages/wrapper.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    home: Wrapper(),
    debugShowCheckedModeBanner: false,
    routes: {
      '/home' : (context) => Home(),
      '/location_map': (context) => LocationMap(),
      '/choose_location': (context) => ChooseLocation(),
      '/profile': (context) => PostList(),
      '/business_card': (context) => BusinessCard(),
      '/add_post': (context) => AddPost(),
      '/login' : (context) => LoginPage(),
      '/signup' : (context) => SignUpPage(),
      '/authenticate' : (context) => Authenticate(),
      '/search_result': (context) => SearchResult(),
      '/add_user_details': (context) => AddUserDetails(),
    },
  ));
}

