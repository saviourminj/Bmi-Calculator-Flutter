import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final iconType;
  final Function onPressed;
  ReusableButton({this.iconType, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: 50,
      ),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Icon(
        iconType,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}