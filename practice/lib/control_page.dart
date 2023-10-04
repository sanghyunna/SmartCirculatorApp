import 'package:flutter/material.dart';
import 'package:practice/custom_button.dart';
import 'package:practice/rotate_button.dart';
import 'package:practice/speed_control.dart';
import 'bulletin.dart';
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
        backgroundColor: Colors.transparent,
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
              stops: [0.0, 1.0],
            ),
          ),
        ),
      ),
      body: Container(
        // 배경색을 위한 Container
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.2),
        ),
        child: Center(
          child: Column(
            //
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Bulletin(),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    // Delete Button
                    iconData: Icons.delete,
                    pressedButton: 'Delete',
                    text: "Choose a waypoint to delete",
                    size: 55,
                  ),
                  const SizedBox(width: 30),
                  CustomButton(
                    // Save Button
                    iconData: Icons.save,
                    pressedButton: 'Save',
                    text: "Choose a waypoint to save",
                    size: 55,
                  ),
                  const SizedBox(width: 30),
                  RotateButton(
                    // Rotation Button
                    iconData: Icons.rotate_right,
                    pressedButton: 'Rotate',
                    selectedWaypoints: [],
                    sendMessagesOrNot: false,
                    size: 55,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                // DpadControl & SpeedControl 가로 배치
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
