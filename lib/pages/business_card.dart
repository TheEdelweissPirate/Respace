import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.amber[100],

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 30, 20, 0),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/sample_dp.png'),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "Mama's Recipe", //USERNAME
                      style: TextStyle(color: Colors.orange,
                      fontSize: 25.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w900,),
                    ),
                    Text(
                      'Homemade jams and preserves', //BUSINESS DESCRIPTION
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        thickness: 2,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Container(
                        width: 300,
                        child: RaisedButton.icon(

                          color: Colors.orangeAccent,
                               icon: Icon(
                                  Icons.phone,
                                  color: Colors.yellowAccent,
                                ),
                                label: Text(
                                  '+229 96119149', //PHONE NUMBER
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,),
                                ),

                            onPressed: (){
                              _launchURL('tel:+229 96119149');
                            },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,20,0),
                      child: Center(
                        child: Container(
                          width: 300,
                          child: RaisedButton.icon(

                                icon: Icon(
                                  Icons.email,
                                  color: Colors.yellowAccent,
                                ),
                            color: Colors.orangeAccent,
                                label:Text(
                                  "mamasrecipe@gmail.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,),
                                ),


                            onPressed: (){
                              _launchURL('mailto:mamasrecipe@gmail.com?subject=Hello Mama!&body=Please contact me'); //EMAIL
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.yellowAccent, style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 20.0,
                      width: 150,
                      child: Divider(
                        thickness: 2,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Container(

                        child: Text(
                          "C-23, Vasant Vihar, Chembur, Mumbai" , //ADDRESS
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20.0,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w900,

                          ),
                        ),




                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        appBar: AppBar(
        actions: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.person_rounded, color: Colors.orangeAccent[100],size: 40.0,),
            ],
            ),
            ],
          title: Text('Business Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w900,)
            ,),
          backgroundColor: Colors.orangeAccent[400],
        ),

    );
  }
}


_launchURL(var url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'Could not launch $url';

  }
}