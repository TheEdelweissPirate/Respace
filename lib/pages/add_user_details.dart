import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:respace/services/database.dart';
import  'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:path/path.dart';

class AddUserDetails extends StatefulWidget {
  @override
  _AddUserDetailsState createState() => _AddUserDetailsState();
}

class _AddUserDetailsState extends State<AddUserDetails> {
  File _image;
  String imgurl1;
  String imgurl2;

  Future uploadPic(BuildContext context) async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print('Image Path $_image');
    });
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    final ref = FirebaseStorage.instance
        .ref()
        .child(_image.path);



    setState(() {
      print("Picture uploaded");
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Picture Uploaded')));
    });
  }


  DatabaseMethods d = new DatabaseMethods();
  //random form key
  String name;
  String establishmentName;
  String establishmentImg;
  String desc;
  String registrationNo;
  bool isRetailer = false;
  bool isProducer = false;
  String address;
  String email;
  String telNo;
  String profileImg;
  bool isOwnAccount = true;
  bool value = false;


  var _valueCheck1 = false;
  var _valueCheck2 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.person_rounded, color: Colors.orangeAccent[100],
                size: 40.0,),
            ],
          ),
        ],
        title: Text('User details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,)
          ,),
        backgroundColor: Colors.orangeAccent[400],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Form(
            key: null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    new TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value; // get value from TextField
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your Name",
                          labelText: "Name ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),

                      ),
                    SizedBox(height: 20,),
                new Text(
                'Are you a producer or retailer? Select any one:',
                style: new TextStyle(

                  fontSize: 18.0,
                ),
              ),
                   SizedBox(height: 20,),

                   StatefulBuilder(
                  // ignore: missing_return
                  builder: (BuildContext context, StateSetter setState) {
                    return new CheckboxListTile(
                      title: const Text('Producer'),
                      value: _valueCheck1,
                      onChanged: (bool value) {
                        setState(() {
                          _valueCheck1 = value;
                          _valueCheck2 = null;
                          isProducer = true;
                          isRetailer = false;
                        });
                      },
                    );
                  }
                   ),
                  StatefulBuilder(
                   builder: (BuildContext context, StateSetter setState) {
                     return new CheckboxListTile(
                       title: const Text('Retailer'),
                       value: _valueCheck2,
                       onChanged: (bool value) {
                         setState(() {
                           _valueCheck2 = value;
                           _valueCheck1 = false;
                           isProducer = true;
                           isRetailer = false;
                         });
                       },

                     );
                   }
                  ),

                    SizedBox(height: 20,),

              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  establishmentName = value; // get value from TextField
                },
                cursorColor: Colors.orange,

                decoration: InputDecoration(
                    hintText: "Establishment Name",
                    labelText: "Business/ Shop Name ",


                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    )
                ),

              ),
                    SizedBox(height: 20,),
                    new FlatButton.icon(onPressed: () async{
                      uploadPic(context);
                      String imageName = basename(_image.path);
                      final file = _image;
                      var storage = FirebaseStorage.instance;
                      StorageReference ref = FirebaseStorage.instance.ref();
                      StorageTaskSnapshot snapshot = await storage
                          .ref()
                          .child("images/$imageName")
                          .putFile(file)
                          .onComplete;

                      if (snapshot.error == null) {
                        imgurl1 = await snapshot.ref.getDownloadURL();
                        Fluttertoast.showToast(
                            msg: "Profile photo uploaded!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.orangeAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                      label: Text("Upload your profile photo"),
                      icon: Icon(Icons.camera_alt_rounded,color: Colors.white,),
                      color: Colors.orangeAccent,),
                    SizedBox(height: 20,),
                    new FlatButton.icon(onPressed: () async {
                      uploadPic(context);
                      String imageName = basename(_image.path);
                      final file = _image;
                      var storage = FirebaseStorage.instance;
                      StorageReference ref = FirebaseStorage.instance.ref();
                      StorageTaskSnapshot snapshot = await storage
                          .ref()
                          .child("images/$imageName")
                          .putFile(file)
                          .onComplete;

                      if (snapshot.error == null) {
                        imgurl2 = await snapshot.ref.getDownloadURL();
                        Fluttertoast.showToast(
                            msg: "Establishment photo uploaded!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.orangeAccent,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                    },
                      label: Text("Upload your establishment's photo"),
                      icon: Icon(Icons.camera_alt_rounded,color: Colors.white,),
                      color: Colors.orangeAccent,),
                    SizedBox(height: 20,),
              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  address = value; // get value from TextField
                },
                decoration: InputDecoration(
                    hintText: "Establishment address",
                    labelText: "Shop/ business address ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
                    SizedBox(height: 20,),
              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  telNo = value; // get value from TextField
                },
                decoration: InputDecoration(
                    hintText: "Establishment contact number",
                    labelText: "Shop/business contact number ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
                    SizedBox(height: 20,),
              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value; // get value from TextField
                },
                decoration: InputDecoration(
                    hintText: "Establishment email",
                    labelText: "business email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
                    SizedBox(height: 20,),

              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  registrationNo = value; // get value from TextField
                },
                decoration: InputDecoration(
                    hintText: "Shop Registration number",
                    labelText: "Registration number ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
                    SizedBox(height: 20,),
              new TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  desc = value; // get value from TextField
                },
                decoration: InputDecoration(
                    hintText: "Other details",
                    labelText: "Shop/business description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)))),

              ),
                    SizedBox(height: 20,),
                    FlatButton(onPressed: () async{
                      d.uploadingUserData(name, establishmentName,
                          establishmentImg = imgurl2 , isRetailer, isProducer, desc, registrationNo,
                          address, email, telNo, profileImg = imgurl1, isOwnAccount);
                      Fluttertoast.showToast(
                          msg: "Profile updated!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.orangeAccent,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }, child: Text("Submit"), color:  Colors.orangeAccent,),
                    SizedBox(height: 20,),
],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
