import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:respace/pages/authenticate/authenticate.dart';
import 'package:respace/services/auth.dart';
import 'home.dart';

Future<int> decide(BuildContext context) async{
  if (await FirebaseAuth.instance.currentUser() != null) { return 1; } else {return 0; }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


      //return either home or authenticate widgets
    Future<int> val = decide(context);
    if (val == 1){
      Navigator.pop(context);
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new Home()));

    }
    else{return Authenticate();}



  }
}


 
