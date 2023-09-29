import 'package:flutter/material.dart';
import 'package:practice/dpad_button.dart';

class SpeedControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Rotation\nSpeed',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
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
