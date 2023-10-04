import 'package:flutter/material.dart';
import 'dpad_button.dart';
import 'message_sender.dart';

class CustomButton extends StatefulWidget {
  final IconData iconData;
  final Color buttonColor;
  final String pressedButton;
  final bool isStopButton;
  final double size;
  final double sizeMultiplier;
  final String text;
  final bool sendMessagesOrNot;

  CustomButton(
      {required this.iconData,
      required this.pressedButton,
      this.sizeMultiplier = 1.00,
      this.isStopButton = false,
      this.text = "Choose a waypoint",
      this.buttonColor = Colors.indigo,
      this.sendMessagesOrNot = false,
      this.size = 80});

  @override
  _CustomSaveState createState() => _CustomSaveState();
}

class _CustomSaveState extends State<CustomButton> {
  void _showInputDialog(BuildContext context) {
    String command = '';
    if (widget.pressedButton == 'Delete') {
      command = 'x';
    } else if (widget.pressedButton == 'Save') {
      command = 'q';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.text),
          content: Container(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      MessageSender messageSender = MessageSender();
                      messageSender.sendMessage('$command 1');
                      Navigator.of(context).pop();
                    },
                    child: Text("1"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MessageSender messageSender = MessageSender();
                      messageSender.sendMessage('$command 2');
                      Navigator.of(context).pop();
                    },
                    child: Text("2"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      MessageSender messageSender = MessageSender();
                      messageSender.sendMessage('$command 3');
                      Navigator.of(context).pop();
                    },
                    child: Text("3"),
                  ),
                ],
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DPadButton(
        iconData: widget.iconData,
        pressedButton: widget.pressedButton,
        sizeMultiplier: widget.sizeMultiplier,
        isStopButton: widget.isStopButton,
        buttonColor: widget.buttonColor,
        size: widget.size,
        sendMessagesOrNot: widget.sendMessagesOrNot,
        onTap: () => _showInputDialog(context));
  }
}
