import 'package:flutter/material.dart';

import 'message_sender.dart';

class DPadButton extends StatefulWidget {
  final IconData iconData;
  final Color buttonColor;
  final String pressedButton;
  final bool isStopButton;
  final double size;
  final double sizeMultiplier;

  DPadButton({
    required this.iconData,
    required this.pressedButton,
    this.sizeMultiplier = 1.00,
    this.isStopButton = false,
    this.buttonColor = Colors.indigo,
    this.size = 80,
  });

  @override
  _DPadButtonState createState() => _DPadButtonState();
}

class _DPadButtonState extends State<DPadButton> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {},
        onTapDown: (_) {
          _onButtonPressed();
        },
        // 일단은 불필요하니 주석처리
        // onTapUp: (_) {
        //   _onButtonRelease();
        // },
        // onTapCancel: () {
        //   _onButtonRelease();
        // },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: (widget.isStopButton)
              ? widget.size * 1.25 * widget.sizeMultiplier * 2.5
              : widget.size * 1.25 * widget.sizeMultiplier,
          height: widget.size * 1.25 * widget.sizeMultiplier,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFA8ADC7), Color(0xFFC8CDEC)],
            ),
            boxShadow: const [
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
          child: Center(
            child: Icon(
              widget.iconData,
              size: widget.size * widget.sizeMultiplier,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    setState(() {
      _isButtonPressed = true;
    });
    print('Button Pressed: ${widget.pressedButton}');

    MessageSender messageSender = MessageSender();
    messageSender.sendMessage(widget.pressedButton);
  }

  void _onButtonRelease() {
    setState(() {
      _isButtonPressed = false;
    });
    print('Button Off: ${widget.pressedButton}');
  }
}
