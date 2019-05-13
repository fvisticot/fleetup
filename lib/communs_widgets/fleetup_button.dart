import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FleetupButton extends StatefulWidget {
  Widget child;
  double minSize;
  final VoidCallback onPressed;
  FleetupButton(
      {@required this.child, this.minSize = 48, @required this.onPressed});

  @override
  _FleetupButtonState createState() => _FleetupButtonState();
}

class _FleetupButtonState extends State<FleetupButton> {
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onVerticalDragStart: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: () {
        widget.onPressed();
      },
      child: SizedBox(
        width: double.infinity,
        height: widget.minSize,
        child: Container(
          color: _isPressed
              ? CupertinoTheme.of(context).barBackgroundColor
              : Colors.white,
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
