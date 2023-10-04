import 'package:flutter/material.dart';

class Bulletin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String waypointOne = '';
    String waypointTwo = '';
    String waypointThree = '';

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
