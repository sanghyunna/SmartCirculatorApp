import 'package:flutter/material.dart';
import 'dpad_button.dart';
import 'message_sender.dart';

class RotateButton extends StatefulWidget {
  final IconData iconData;
  final Color buttonColor;
  final String pressedButton;
  final bool isStopButton;
  final double size;
  final double sizeMultiplier;
  final String text;
  final bool sendMessagesOrNot;
  final List<String> selectedWaypoints;

  RotateButton({
    required this.iconData,
    required this.pressedButton,
    this.sizeMultiplier = 1.00,
    this.isStopButton = false,
    this.text = "Choose the order to rotate",
    this.buttonColor = Colors.indigo,
    this.size = 80,
    this.sendMessagesOrNot = false,
    required this.selectedWaypoints,
  });

  @override
  _RotateState createState() => _RotateState();
}

class _RotateState extends State<RotateButton> {
  void _updateSelectedWaypoints(String waypoint) {
    setState(() {
      widget.selectedWaypoints.add(waypoint);
    });
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text(widget.text),
            content: Container(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("User selected option 1");
                          _updateSelectedWaypoints("1");
                          setState(() {});
                        },
                        child: Text("1"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("User selected option 2");
                          _updateSelectedWaypoints("2");
                          setState(() {});
                        },
                        child: Text("2"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("User selected option 3");
                          _updateSelectedWaypoints("3");
                          setState(() {});
                        },
                        child: Text("3"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.selectedWaypoints
                          .toString()
                          .split("[")[1]
                          .split(']')[0])
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print('Rotate Button canceled');
                            Navigator.of(context).pop();
                            widget.selectedWaypoints.clear();
                          },
                          child: Text('Cancel')),
                      ElevatedButton(
                          onPressed: () {
                            print('Rotate Button confirmed');
                            Navigator.of(context).pop();
                            String temp = widget.selectedWaypoints.join(' ');
                            widget.selectedWaypoints.clear();
                            MessageSender messageSender = MessageSender();
                            messageSender.sendMessage('r ' + temp);
                          },
                          child: Text('Confirm')),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
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
