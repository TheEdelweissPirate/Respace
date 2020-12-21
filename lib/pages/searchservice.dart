import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchService {
  searchByName(String searchField) {

    print(searchField);
    print("searching...");
    if (searchField == null){
      return Container(
        child: Text("null hai"),
      );
    }
    return StreamBuilder<QuerySnapshot>(

      stream: (searchField != "" && searchField != null)
          ? Firestore.instance
          .collection("users")
          .where("establishmentName", isEqualTo: searchField.substring(0, 1).toUpperCase())
          .snapshots()
          : Firestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        print("Builder here");
        return (snapshot.connectionState == ConnectionState.waiting)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            DocumentSnapshot data = snapshot.data.documents[index];
            return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data['profileImg']),
                        radius: 20.0,
                      ),
                      title: Text(
                        data['name'],
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
                        child: FlatButton(onPressed:(){
                          Navigator.pushNamed(context, '/profile');
                        }, child: Text("Visit profile",style: TextStyle(
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
    );

  }

}

