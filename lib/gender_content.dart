import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class genderContent extends StatelessWidget {
  final IconData avatar;
  final String gender;
  genderContent({@required this.avatar, @required this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Icon(
            avatar,
            color: Colors.white,
            size: 100,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            gender,
            style: labelText,
          ),
        )
      ],
    );
  }
}
