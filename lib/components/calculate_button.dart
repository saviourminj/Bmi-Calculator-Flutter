
import 'package:flutter/material.dart';

import 'constant.dart';

class CalculateButton extends StatelessWidget {
  final String buttonText ;
  final Function page;
  CalculateButton({@required this.buttonText , @required this.page});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: kCalculateButton,
        ),
        margin: EdgeInsets.only(left: 10, right: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xFFEB1555),
            borderRadius: BorderRadius.circular(15.0)),
      ),
      onTap: page,
    );
  }
}