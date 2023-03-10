import 'dart:math';
import 'package:flutter/material.dart';

class CalculateBMI {
  final height;
  final weight;
  double BMI;
  CalculateBMI({@required this.height, @required this.weight});

  String calcBmi() {
    BMI = weight / pow(height / 100, 2);

    return BMI.toStringAsFixed(1);
  }

  String resultText() {
    if (BMI >= 25) {
      return 'Overweight';
    } else if (BMI < 18.5) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String interpretationText() {
    if (BMI >= 25) {
      return 'Weight is more. You need to exercise';
    } else if (BMI <= 18.5) {
      return 'You are underweight. You need to eat more';
    } else {
      return 'Your diet is great';
    }
  }
}
