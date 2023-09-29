import 'package:flutter/material.dart';
import 'package:practice/speed_control.dart';
import 'dpad_control.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Circulator Controller',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:
            Colors.transparent, // Set the app bar background to transparent
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo.withOpacity(0.8),
                Colors.indigo.withOpacity(0.2)
              ], // Define your gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                1.0
              ], // Adjust stops to control the gradient transition
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.2),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DpadControl(size: 0.7),
                  const SizedBox(width: 50),
                  SpeedControl(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
