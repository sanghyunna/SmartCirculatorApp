import 'package:flutter/material.dart';

class DPadButton extends StatelessWidget {
  final directionsToSymbols = {
    'Up': 'Dpad Up',
    'Down': 'Dpad Down',
    'Left': 'Dpad Left',
    'Right': 'Dpad Right',
    'Speed Up': 'Speed Up',
    'Speed Down': 'Speed Down',
    'One': '1',
    'Two': '2',
    'Three': '3',
  };
  final IconData iconData;
  final Color buttonColor;
  final String pressedButton;
  final double size;
  final double sizeMultiplier;

  DPadButton({
    required this.iconData,
    required this.pressedButton,
    this.sizeMultiplier = 1.00,
    this.buttonColor = Colors.indigo,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size * 1.25 * sizeMultiplier,
      height: this.size * 1.25 * sizeMultiplier,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFA8ADC7), Color(0xFFC8CDEC)],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF9498AF),
            offset: Offset(8, 8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: Color(0xFFE2E8FF),
            offset: Offset(-8, -8),
            blurRadius: 16,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => _onButtonPressed(this.pressedButton),
        child: Icon(
          iconData,
          size: this.size * sizeMultiplier,
          color: Colors.white,
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded rectangle
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(String direction) {
    // 여기에 블루투스 모듈 추가할 것
    print('Button Pressed: ${directionsToSymbols[direction]}');
  }
}
