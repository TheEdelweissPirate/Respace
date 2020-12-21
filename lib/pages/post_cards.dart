import 'package:flutter/material.dart';
import 'package:respace/models/ProductModel.dart';
import 'package:respace/models/UserModel.dart';
import 'package:expandable/expandable.dart';
import 'package:respace/custom_expansion_tile.dart' as custom;

//SAMPLE HARD-CODED DATA
    The_User _user = new The_User(name: "Mama's Pickle", isProducer: true, isOwnAccount: true, desc : "Homemade pickles and preserves", profileImg:"images/sample_dp.png", email: 'mamasrecipe@gmail.com',
    address: "C-23, Vasant Vihar, Chembur, Mumbai", telNo: '+229 96119149');

class PostCard extends StatefulWidget {
  dynamic name;
  dynamic desc;
  dynamic price;
  dynamic isAvailable;
  dynamic details;
  dynamic category;
  dynamic profileImg;

  PostCard({
    @required this.name,
    @required this.desc,
    @required this.price,
    @required this.isAvailable,
    @required this.details,
    @required this.category,
    @required this.profileImg,
  });

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {


      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Container(
                height: 100,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.profileImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                  fontSize: 15,
                                  fontFamily: 'Quicksand'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              width: 100,
                              child: Text(
                                widget.desc,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orangeAccent,
                                    fontSize: 12,
                                fontFamily: 'Quicksand'),
                              ),
                            ),
                          ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Rs. ${widget.price}",
                              style:
                              TextStyle(color: Colors.orange, fontSize: 20)),
                        ),
                      Row(
                        children: <Widget>[
                          widget.isAvailable ? Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Chip(
                              label: Text(
                                "Available",
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.greenAccent,
                            ),
                          ):  Chip(
                            label: Text(
                              "Unavailable",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.redAccent,
                          ) ,
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.orange,), color: Colors.white, )
                        ],
                      )


                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      );
    }

  }


