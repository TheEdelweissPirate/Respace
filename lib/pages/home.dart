
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:respace/pages/search_result_list.dart';


import 'package:respace/pages/authenticate/login.dart';
import 'package:respace/pages/profile.dart';

import 'profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Firestore firestoreInstance = new Firestore();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    return user.uid;
  }
    @override
     Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Icon(Icons.home,color: Colors.orangeAccent[100],size: 40.0,),
          ],
          title: Text('Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w900,)
            ,),
          backgroundColor: Colors.orangeAccent[400],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 60.0,
              ),
              ListTile(
                leading: Icon(Icons.person_rounded, color: Colors.orange),
                title: Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new PostList()));
                },
              ),


              ListTile(
                leading: Icon(Icons.help_rounded, color: Colors.orange),
                title: Text(
                  'Help',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.orange),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onTap: () {
                  _auth.signOut();
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (ctxt) => new LoginPage()));
                },
              ),
            ],
          ),
        ),

        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40,0),
                  child: Image.asset('images/respace logo transparent.png',
                    height: 200.0,
                    width: 200.0,),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 50,0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 50.0,
                    child: RaisedButton.icon(onPressed: (){
                      showSearch(context: context, delegate: DataSearch());
                    },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
                        ),
                      ),

                      icon: Icon(Icons.search_rounded,
                          color: Colors.amberAccent),
                      label: Text('Search for a business',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,),
                      ),
                      color: Colors.orangeAccent,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 50,0),
                  child: ButtonTheme(
                    minWidth: 254.0,
                    height: 50.0,
                    child: RaisedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, '/choose_location');
                    },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
                        ),
                      ),
                      icon: Icon(Icons.location_on_rounded,
                          color: Colors.amberAccent),
                      label: Text('  Search by location  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,),
                      ),
                      color: Colors.orangeAccent,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 50,0),
                  child: ButtonTheme(
                    minWidth: 254.0,
                    height: 50.0,
                    child: RaisedButton.icon(onPressed: (){
                      showSearch(context: context, delegate: DataSearch());
                    },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
                        ),
                      ),
                      icon: Icon(Icons.search_rounded,
                          color: Colors.amberAccent),
                      label: Text('Search for a product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w900,),
                      ),
                      color: Colors.orangeAccent,),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 10, 50, 0),
              child: ButtonTheme(
                minWidth: 254.0,
                height: 50.0,
                child: RaisedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add_user_details');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      side: BorderSide(
                        color: Colors.yellowAccent,
                        style: BorderStyle.solid,
                      ),
                    ),
                    icon: Icon(Icons.person_rounded,
                        color: Colors.amberAccent),
                    label: Text(
                      "Update user details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    color: Colors.orangeAccent),
              ),
                    ),
              ],
            ),
          ),
        )
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  //this is hard coded. here we will have to connect it to database.
  final producers = [
    'Mumbai Handicrafts',
    'Bhopal Milk',
    'Rajasthani bangles',
    'Hello World electricals',
    'Go cheese',
    'JoJo Anime Merch',
    'Bengal Tiger',
    'Kerala Sweets',
    'Grandma pickles',
    'Weave center',
    'Silk fly',
    'Embroidery Sanju',
    'Perfect Tailors',
    "Mama's Recipe",
  ];

  final recentProducers = [
    'Bengal Tiger',
    'Kerala Sweets',
    'Grandma pickles',
    "Mama's Recipe",
  ];


  @override
  ThemeData appBarTheme(BuildContext context) {
    // You can use Theme.of(context) directly too
    var superThemeData = super.appBarTheme(context);

    return superThemeData.copyWith(
      textTheme: superThemeData.textTheme.copyWith(
        headline6: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black54,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on left of app bar
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ),
        onPressed: () {
          close(context, 'null');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return searchCard(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    for (int i = 0; i<producers.length;i++){
      producers[i] = producers[i].toLowerCase();
    }
    for (int i = 0; i<recentProducers.length;i++){
      recentProducers[i] = recentProducers[i].toLowerCase();
    }
    final suggestionList = query.isEmpty ? recentProducers : producers.where((p) => p.startsWith(query.toLowerCase())).toList();

    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
          onTap: (){
            showResults(context);
          },
          leading: Icon(Icons.business_rounded),
          title: RichText(text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.orangeAccent,fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand', fontSize: 20.0,
            ),
            children: [TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'Quicksand',fontSize: 20.0,
              ),
            )],
          ),),
        ),
      itemCount: suggestionList.length,
    );
  }
}

