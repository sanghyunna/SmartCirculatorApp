import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'message_sender.dart';
import 'package:path_provider/path_provider.dart';

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
    Future<void> readJsonFromFile() async {
      final directory = await getApplicationDocumentsDirectory();
      final file =
          File('C:\\dev\\SmartCirculatorApp\\practice\\lib\\waypoints.json');

      if (await file.exists()) {
        String jsonString = await file.readAsString();
        Map<String, dynamic> data = json.decode(jsonString);
        refresh(1, data['waypoint1']);
        refresh(2, data['waypoint2']);
        refresh(3, data['waypoint3']);
      } else {
        print('File does not exist');
        // Handle the case where the file doesn't exist
      }
    }

    return Container(
      width: 320,
      height: 170,
      color: Colors.indigo.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await MessageSender().sendMessage('o');
                    await readJsonFromFile();
                  },
                  child: Text('Refresh')),
              SizedBox(width: 200),
            ],
          ),
          SizedBox(height: 5),
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
