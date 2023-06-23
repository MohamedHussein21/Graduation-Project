import 'package:flutter/material.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/font_mange.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome back to ',
          style: TextStyle(
              fontWeight: FontWeightManger.bold,
              fontSize: 22,
              color: ColorManger.darkColor),
        ),
        Text(
          'MRI REPORT. ',
          style: TextStyle(
              fontWeight: FontWeightManger.bold,
              fontSize: 20,
              color: ColorManger.defaultColor),
        ),
      ],
    );
  }
}
