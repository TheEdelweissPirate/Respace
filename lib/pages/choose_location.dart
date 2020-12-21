import 'package:flutter/material.dart';
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final _startPointController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your location",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w900,),
        ),
        backgroundColor: Colors.orangeAccent[400],
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.location_on_rounded, color: Colors.orangeAccent[100],size: 40.0,),
            ],
          ),

        ],

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: CustomTextField(
          hintText: "Enter your location here",
          textController: _startPointController,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MapBoxAutoCompleteWidget(
                  apiKey: "pk.eyJ1IjoidmFyYWRhaCIsImEiOiJja2lycjU4emEwZGZtMnBzYzhrcTJ5YTN3In0.QY3-YwtFpHOATLUAgBX0ow",
                  hint: "Start typing...",
                  onSelect: (place) {
                    _startPointController.text = place.placeName;
                  },
                  limit: 10,
                ),
              ),
            );
          },
          enabled: true,
        ),
      ),
    );
  }
}





























