import 'package:flutter/material.dart';
import 'tiles.dart';
import 'gender_content.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'functionality.dart';

enum Gender {
  male,
  female,
}

int height = 180;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCardGender;

  // Color maleTileColor = inactiveTileColor;
  // Color femaleTileColor = inactiveTileColor;

  // void setTileColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleTileColor == inactiveTileColor) {
  //       maleTileColor = activeTileColor;
  //       femaleTileColor = inactiveTileColor;
  //     } else {
  //       maleTileColor = inactiveTileColor;
  //     }
  //   } else {
  //     if (selectedGender == Gender.female) {
  //       if (femaleTileColor == inactiveTileColor) {
  //         femaleTileColor = activeTileColor;
  //         maleTileColor = inactiveTileColor;
  //       } else {
  //         femaleTileColor = inactiveTileColor;
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardGender = Gender.male;
                      });
                    },
                    child: PlaceTile(
                      colour: (selectedCardGender == Gender.male)
                          ? activeTileColor
                          : inactiveTileColor,
                      cardChild: genderContent(
                        avatar: Icons.male,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardGender = Gender.female;
                      });
                    },
                    child: PlaceTile(
                      colour: selectedCardGender == Gender.female
                          ? activeTileColor
                          : inactiveTileColor,
                      cardChild: genderContent(
                        avatar: Icons.female,
                        gender: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: PlaceTile(
              colour: inactiveTileColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: sliderHeight,
                        ),
                        Text(
                          'cm',
                          style: labelText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 130,
                        max: 220,
                        activeColor: Color.fromARGB(255, 173, 105, 131),
                        inactiveColor: Color(0xff8d8e98),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PlaceTile(
                    colour: inactiveTileColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelText,
                        ),
                        Text(
                          weight.toString(),
                          style: sliderHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PlaceTile(
                    colour: inactiveTileColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelText,
                          ),
                          Text(
                            age.toString(),
                            style: sliderHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 15,
                              ),
                              IconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(
                                      () {
                                        age++;
                                      },
                                    );
                                  })
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () {
                CalculateBMI ans = CalculateBMI(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiValue: ans.calcBmi(),
                        bmiText: ans.resultText(),
                        bmiInterpretation: ans.interpretationText(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Color(0xffeb1555),
                child: Center(
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Custom floating action button
class IconButton extends StatelessWidget {
  IconButton({@required this.icon, @required this.onPressed});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      fillColor: Color.fromARGB(255, 173, 105, 131),
      elevation: 2,
    );
  }
}
