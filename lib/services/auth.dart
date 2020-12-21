import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:respace/pages/authenticate/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:respace/pages/home.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  BuildContext get context => null;


  Future signup(String email, String password, BuildContext context) async{
    final _auth = FirebaseAuth.instance;


    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Fluttertoast.showToast(
            msg: "Sign up Successful! Log in to continue",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
        );
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => LoginPage()),
        );
      }
    }
    catch (e)
    {
      print(e);
    }
  }

  Future login(dynamic email, dynamic password, BuildContext context) async{
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(newUser.toString());
      if (newUser != null) {
        Fluttertoast.showToast(
            msg: "Login Successful!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.orangeAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        if (await FirebaseAuth.instance.currentUser() != null){
          Navigator.pop(context);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new Home()));
          print("HOME PAGE");
        }

      }
    } catch (e) {}
  }

  signOut() async {
    await _auth.signOut();
  }
  }


