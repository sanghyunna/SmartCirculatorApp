import 'package:flutter/material.dart';

class Bulletin extends StatefulWidget {
  @override
  _BulletinState createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> {
  String waypointOne = '';
  String waypointTwo = '';
  String waypointThree = '';

  void refresh(int n, String location) {
    if (n == 1) {
      setState(() {
        waypointOne = location;
      });
    } else if (n == 2) {
      setState(() {
        waypointTwo = location;
      });
    } else if (n == 3) {
      setState(() {
        waypointThree = location;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      color: Colors.indigo.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Waypoint 1: $waypointOne',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Waypoint 2: $waypointTwo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Waypoint 3: $waypointThree',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
