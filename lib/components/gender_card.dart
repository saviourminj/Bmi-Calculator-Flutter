import 'constant.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final genderIcon;
  GenderCard({@required this.gender, @required this.genderIcon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          color: Colors.white,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          gender,
          style: textDesign,
        ),
      ],
    );
  }
}