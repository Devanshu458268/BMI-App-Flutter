import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiText;
  final String bmiValue;
  final String bmiInterpretation;

  ResultsPage(
      {@required this.bmiInterpretation,
      @required this.bmiText,
      @required this.bmiValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text("Result"),
        ),
        body: Container(
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: inactiveTileColor,
                  child: Center(
                      child: Text(
                    bmiText.toUpperCase(),
                    style: TextStyle(
                      color: Color(0xff24d876),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  )),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                ),
              ),
              Expanded(
                child: Container(
                  color: inactiveTileColor,
                  child: Center(
                      child: Text(
                    bmiValue,
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
                  )),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ),
              Expanded(
                child: Container(
                  color: inactiveTileColor,
                  child: Center(
                      child: Text(
                    bmiInterpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  )),
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                ),
              ),
              SafeArea(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 70,
                      color: Color(0xffeb1555),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "RE-CALCULATE",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
