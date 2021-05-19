import 'dart:math';
import 'package:flutter/cupertino.dart';

class BMICalculator{

  final int height;
  final int weight;
  double _bmi = 0;
  BMICalculator({@required this.weight,@required this.height});

  double bmiCalculate(){
    _bmi = weight  / pow(height/100, 2);
    return _bmi;
  }

  String suggestion(){
    if(_bmi >= 25){
      return 'Your BMI is higher than normal body weight. Try to exercise more';
    }else if(_bmi > 18.5){
      return 'Your BMI is normal. Keep it UP';
    }else{
      return 'Your BMI is less than normal body weight. Try to eat more whenever possible';
    }
  }

  String bodyTpe(){
    if(_bmi >= 25){
      return 'Overweight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }


}