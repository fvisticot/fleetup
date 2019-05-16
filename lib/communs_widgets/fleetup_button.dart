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
        //width: double.infinity,
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

class FleetupDateButton extends StatefulWidget {
  String text;
  double minSize;
  final VoidCallback onPressed;
  FleetupDateButton(this.text, {this.minSize = 48, this.onPressed});

  @override
  _FleetupDateButtonState createState() => _FleetupDateButtonState();
}

class _FleetupDateButtonState extends State<FleetupDateButton> {
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
        //width: double.infinity,
        height: widget.minSize,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: CupertinoColors.lightBackgroundGray),
            color: _isPressed
                ? CupertinoTheme.of(context).barBackgroundColor
                : Colors.white,
          ),
          child: Center(
            child: Text(widget.text,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'NotoSans',
                  fontSize: 12.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ),
    );
  }
}
