import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 60.0,),
              ListTile(
                leading: Icon(Icons.person_rounded,
                color: Colors.orange),
                title: Text('My Profile',
                style: TextStyle(
                color: Colors.orange,
                  fontSize: 20.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w900,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.message_rounded,
                    color: Colors.orange),
                title: Text('My Messages',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w900,),),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),

        ),


        body: SafeArea(
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
                       padding: const EdgeInsets.fromLTRB(50, 10, 40,0),
                       child: ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton.icon(onPressed: (){
                          showSearch(context: context, delegate: DataSearch());
                        },
                          icon: Icon(Icons.search,
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
                padding: const EdgeInsets.fromLTRB(50, 10, 40,0),
                child: ButtonTheme(
                  minWidth: 254.0,
                  height: 50.0,
                  child: RaisedButton.icon(onPressed: (){
                    showSearch(context: context, delegate: DataSearch());
                  },
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




            ],
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
  ];

  final recentProducers = [
    'JoJo Anime Merch',
    'Bengal Tiger',
    'Kerala Sweets',
    'Grandma pickles',
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
      close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on selection
    return Container(
        height: 100.0,
    width: 100.0,
      child: Card(
      color: Colors.orangeAccent[200],
      child: Center(
        child:Text('Respective Profile will be shown'),
      ) ,
    ),);

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

