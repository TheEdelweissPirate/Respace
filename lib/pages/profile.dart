import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:respace/pages/search_result_list.dart';
import 'post_cards.dart';
import 'package:respace/models/ProductModel.dart';
import 'package:respace/models/UserModel.dart';

//SAMPLE HARD-CODED DATA

The_User _user = new The_User(name: "Mama's Pickle", isProducer: true, isOwnAccount: true, desc : "Homemade pickles and preserves", profileImg:"images/sample_dp.png", email: 'mamasrecipe@gmail.com',
address: "C-23, Vasant Vihar, Chembur, Mumbai", telNo: '+229 96119149');

List<Product> Products = [
  Product(name: 'Homemade Apple Jam',
      profileImg: 'images/pic-1.png',
      desc: "With a hint of cinnamon and apricot",
      price: 200,
      isAvailable: true,
      details: 'We charge price per half litre. Shipping charges extra. Price is negotiable.'),
  Product(name: 'Orange Marmalade',
      profileImg: 'images/pic-2.png',
      desc: "Our signature jam",
      price: 250,
      isAvailable: true,
      details: 'We charge price per half litre. Shipping charges extra'),
  Product(name: 'Good Old Mixed Fruit Jam',
      profileImg: 'images/pic-3.png',
      desc: "Everyone's favourite",
      price: 450,
      isAvailable: false,
      details: 'We charge price per half litre. Shipping charges extra'),
  Product(name: 'Carrot Pickles',
      profileImg: 'images/pic-4.png',
      desc: "With carrots, garlic, ginger and green chillies",
      price: 450,
      isAvailable: true,
      details: 'We charge price per half litre. Shipping charges extra. Jain variety available.'),

];


class PostList extends StatefulWidget {

  String name;
  String desc;
   String price;
   String category;
   bool isAvailable;
   String profileImg;
   String details;
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  Firestore firestoreInstance = new Firestore();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    print(user.uid);
    return user.uid.toString();
  }

  Widget _getFAB() {
    if (_user.isOwnAccount) {
      return FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, '/add_post');
          });
    }
    else{
      return Container();
    }

  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          floatingActionButton: _getFAB(),

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
            title: Text('Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w900,)
              ,),
            backgroundColor: Colors.orangeAccent[400],
          ),
          body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,10,0,0),
                            child: CircleAvatar(
                                backgroundImage: AssetImage(_user.profileImg,),
                                maxRadius: 45.0,),
                          ),


                          Column(
                            children: [
                              SizedBox(height: 20.0,),
                              SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(_user.name, //Username_here
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 25.0,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.w900,),),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: RaisedButton.icon(onPressed: () {
                                  Navigator.pushNamed(context, '/business_card');
                                },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(color: Colors.yellowAccent,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  icon: Icon(Icons.quick_contacts_mail_rounded,
                                    color: Colors.amberAccent,),
                                  label: Text("Get Business Card", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,),),
                                  color: Colors.orangeAccent,
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),

                      StreamBuilder(
                      stream: Firestore.instance.collection("products").snapshots(),
                      builder: (context, snapshot) {
                        print(getCurrentUser());
                      return !snapshot.hasData
                        ? Text('Please Wait')
                          :ListView.builder( shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot products = snapshot.data.documents[index];
                            return  PostCard(name: products['productName'],desc: products['desc'],
                            category: products['category'],isAvailable: products['isAvailable'],details:products['details'] ,
                            profileImg: products['profileImg'],price: products['productPrice'],);},
                      );
                      },
                      )]
            ),

              );
  }
  }