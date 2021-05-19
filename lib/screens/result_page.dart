
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/components/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String suggestion;
  final String bodyType;
  final double bmiVal;

  String suggest(){
    if(bmiVal >= 25){
      return 'Your BMI is higher than normal body weight. Try to exercise more';
    }else if(bmiVal > 18.5){
      return 'Your BMI is normal. Keep it UP';
    }else{
      return 'Your BMI is less than normal body weight. Try to eat more whenever possible';
    }
  }


  ResultPage({@required this.bodyType,@required this.bmiVal,@required this.suggestion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Your Result',
                style: heightDesign,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bodyType, style: kBmiResult),
                  Text(
                    bmiVal.toStringAsFixed(1),
                    style: kBmiResNum,
                  ),
                  Text(
                    '${suggest()}',
                    style: kBmiResultText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonText: 'Recalculate your BMI',
            page: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
