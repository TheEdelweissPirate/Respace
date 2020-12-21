import  'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:respace/services/database.dart';
import 'dart:async';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  File _image;
  String imgurl;
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
      print("Product Picture uploaded");
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Product Picture Uploaded')));
    });
  }

  //random form key
  DatabaseMethods d = new DatabaseMethods();
  var _valueCheck = false;
  String name;
  String desc;
  String profileImg;
  bool isAvailable;
  String category;
  String details;
  String price;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.add, color: Colors.orangeAccent[100],
                size: 40.0,),
            ],
          ),
        ],
        title: Text('Add a product',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,)
          ,),
        backgroundColor: Colors.orangeAccent[400],
      ),
      body: Builder(
        builder : (context) => SafeArea(
          child: new Form(
            key: null,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                new TextField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article),
                    hintText: 'What is your product called?',
                    labelText: 'Enter product name',

                  ),
                  onChanged: (value) {
                    name = value; // get value from TextField
                  },
                ),
                new TextField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article),
                    hintText: 'Write a short sentence about your product',
                    labelText: 'Enter product description',
                  ),
                  onChanged: (value) {
                    desc = value; // get value from TextField
                  },
                ),
                new FlatButton.icon(onPressed: (){
                  uploadPic(context);
                },
                    label: Text("Upload product photo"),
                icon: Icon(Icons.camera_alt_rounded,color: Colors.white,),
                color: Colors.orangeAccent,),
                new TextField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article),
                    hintText: 'Enter your product category',
                    labelText: 'Product Category',
                  ),
                  onChanged: (value) {
                    category = value; // get value from TextField
                  },

                ),
                new TextField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article),
                    hintText: 'Enter your product price',
                    labelText: 'Product price',
                  ),
                  onChanged: (value) {
                    price = value; // get value from TextField
                  },

                ),
                new TextField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.article),
                    hintText: 'Enter additional product details',
                    labelText: 'Product details',
                  ),
                  onChanged: (value) {
                    details = value; // get value from TextField
                  },

                ),
                  StatefulBuilder(
                  // ignore: missing_return
                  builder: (BuildContext context, StateSetter setState) {
                    return new CheckboxListTile(
                      title: const Text('Available'),
                      value: _valueCheck,
                      onChanged: (bool value) {
                        setState(() {
                          _valueCheck = value;
                          isAvailable = true;
                        });
                      },

                    );
                  }
    ),
                  FlatButton(onPressed: () async{
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
                        imgurl = await snapshot.ref.getDownloadURL();
                      }
                      d.uploadingProductData(name, price, profileImg = imgurl, isAvailable, desc, details, category);
                      Fluttertoast.showToast(
                          msg: "Product Added!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.orangeAccent,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      }, child: Text("Submit"), color:  Colors.orangeAccent,),
              ]
            ),

          ),
        ),
      ),
    );
  }
}
