import 'package:flutter/material.dart';

import 'dpad_button.dart';

class DpadControl extends StatelessWidget {
  final double size;

  DpadControl({this.size = 1.00});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.filter_1,
              pressedButton: 'One',
              size: 60 * size,
              buttonColor: Colors.red,
            ),
            SizedBox(width: 20 * size),
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.filter_2,
              pressedButton: 'Two',
              size: 60 * size,
              buttonColor: Colors.red,
            ),
            SizedBox(width: 20 * size),
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.filter_3,
              pressedButton: 'Three',
              size: 60 * size,
              buttonColor: Colors.red,
            ),
          ],
        ),
        SizedBox(height: 50 * size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.arrow_circle_up,
              pressedButton: 'Up',
              buttonColor: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 4 * size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.arrow_circle_left_outlined,
              pressedButton: 'Left',
              buttonColor: Colors.blue,
            ),
            SizedBox(width: 90 * size),
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.arrow_circle_right_outlined,
              pressedButton: 'Right',
              buttonColor: Colors.blue,
            ),
          ],
        ),
        SizedBox(height: 4 * size),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DPadButton(
              sizeMultiplier: size,
              iconData: Icons.arrow_circle_down_outlined,
              pressedButton: 'Down',
              buttonColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
