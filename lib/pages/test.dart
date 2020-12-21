import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  String searchvalue;
  Test({String sv}){
    searchvalue = sv;
  }

  @override
  _TestState createState() => _TestState(sv: searchvalue);
}

class _TestState extends State<Test> {

  String searchvalue;

  _TestState({String sv}) {
    searchvalue = sv;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: (searchvalue != "" && searchvalue != null)
            ? Firestore.instance
            .collection('users')
            .where("establishmentName", isEqualTo: searchvalue.toUpperCase())
            .snapshots()
            : Firestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text('Please Wait')
              : ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data.documents[index];

              return Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          data['establishmentName'],
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          data['desc'],
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                        child: Container(
                          height: 25,
                          width: 100,
                          child: FlatButton(onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          }, child: Text("Visit profile", style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 12,
                          ),),
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  )
              );
            },
          );
        },


      ),
    );
  }
}