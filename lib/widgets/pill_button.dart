import 'package:flutter/material.dart';

import '../data.dart';

class PillButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;

  PillButton({
    @required this.onPressed,
    @required this.buttonText,
    @required this.width,
    this.height = 55,
    this.fontSize = 20,
    @required this.color,
    @required this.textColor,
    this.fontWeight = FontWeight.bold,
  });

  @override
  _PillButtonState createState() => _PillButtonState();
}

class _PillButtonState extends State<PillButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: widget.color,
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: widget.onPressed,
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                  color: widget.textColor,
                  fontWeight: widget.fontWeight,
                  fontSize: widget.fontSize,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),
    );
  }
}
