import 'package:flutter/material.dart';
import 'package:respace/models/ProductModel.dart';
import 'package:respace/models/UserModel.dart';
import 'package:respace/services/database.dart';



//SAMPLE HARD-CODED DATA
// ignore: non_constant_identifier_names
List<The_User> Users = [
  The_User(name: "JoJo Anime Merch",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Go cheese",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Joe's Kitchen",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
  The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),The_User(name: "Mama's Recipe",telNo: "9685325741", isProducer: true, address: "Chembur, Mumbai",email: "mamas@gmail.com",desc: "Homemade peickles and preserves",profileImg:"images/sample_dp.png" ,),
];

The_User p = new The_User();

Widget searchCard(BuildContext context){
  p.name = "Mama's Recipe";
  p.telNo = "9685325741";
  p.isProducer= true;
  p.address= "Chembur, Mumbai";
  p.email= "mamas@gmail.com";
  p.desc= "Homemade pickles and preserves";
  p.profileImg="images/sample_dp.png";

  return Card(
    child: Column(
      children: [
    ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage(p.profileImg),
      radius: 20.0,
    ),
    title: Text(
      p.name,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 20.0,
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w900,
      ),
    ),
    subtitle: Text(
      p.desc,
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


}

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.search_rounded, color: Colors.orangeAccent[100],
                size: 40.0,),
            ],
          ),
        ],
        title: Text('Search results',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,)
          ,),
        backgroundColor: Colors.orangeAccent[400],
      ),
      body: SingleChildScrollView(
          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: Users.map((p) {
                      return searchCard(context);
                    }).toList()
                )
          )
      );
  }
}





