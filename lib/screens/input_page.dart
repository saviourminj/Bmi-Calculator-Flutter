

import 'package:bmi_calculator/components/constant.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/reusable_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/functionality/bmi_calculator.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/calculate_button.dart';

enum Gender { male, female }

int height = 0;
int weight = 30;
int age = 10;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveButtonColor
                        : kInactiveButtonColor,
                    cardChild: GenderCard(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveButtonColor
                        : kInactiveButtonColor,
                    cardChild: GenderCard(
                      gender: 'FEMALE',
                      genderIcon: FontAwesomeIcons.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveButtonColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height ',
                        style: heightDesign,
                      ),
                      Text(
                        'cm',
                        style: textDesign,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 0.0,
                      max: 250,
                    ),
                  ),
                  Text(
                    'HEIGHT',
                    style: textDesign,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveButtonColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: textDesign,
                        ),
                        Text(
                          '$weight',
                          style: heightDesign,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableButton(
                              iconType: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ReusableButton(
                              iconType: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0)
                                    weight--;
                                  else
                                    weight = weight;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveButtonColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: textDesign,
                        ),
                        Text(
                          '$age',
                          style: heightDesign,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ReusableButton(
                              iconType: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ReusableButton(
                              iconType: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1)
                                    age--;
                                  else
                                    age = age;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          CalculateButton(
          buttonText: 'Calculate your BMI ->',
            page: () {
            BMICalculator bmi = BMICalculator(
              height: height,
              weight: weight,
            );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    suggestion: bmi.suggestion(),
                    bmiVal: bmi.bmiCalculate(),
                    bodyType: bmi.bodyTpe(),
                  ),
                ),
              );
            },
          ),

          // Container(
          //   color: Color(0XFFEB1555),
          //   width: double.infinity,
          //   height: kBottomButton,
          //   margin: EdgeInsets.only(
          //     top: 10.0,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('Calculate Your BMI',
          //       style: TextStyle(
          //         fontSize: 30
          //       ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}


