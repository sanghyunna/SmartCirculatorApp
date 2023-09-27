import 'package:flutter/material.dart';
import 'package:practice/dpad_button.dart';

class SpeedControl extends StatelessWidget {
  // makes two dpad buttons, up and down
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Speed',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.withOpacity(0.8),
          ),
        ),
        SizedBox(height: 15),
        DPadButton(
          sizeMultiplier: 0.8,
          iconData: Icons.keyboard_double_arrow_up_sharp,
          pressedButton: 'Speed Up',
          buttonColor: Colors.blue,
        ),
        SizedBox(height: 50),
        DPadButton(
          sizeMultiplier: 0.8,
          iconData: Icons.keyboard_double_arrow_down_sharp,
          pressedButton: 'Speed Down',
          buttonColor: Colors.blue,
        ),
      ],
    );
  }
}
