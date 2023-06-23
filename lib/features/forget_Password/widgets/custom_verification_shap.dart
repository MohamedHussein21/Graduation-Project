import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/font_mange.dart';

class CustomVerificationShap extends StatelessWidget {
  final String address;
  final String image;
  final String info;
  const CustomVerificationShap({
    Key? key,
    required this.address,
    required this.image,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          address,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeightManger.bold,
              color: ColorManger.defaultColor),
        ),
        SizedBox(
          height: context.heigh * 0.04,
        ),
        Image.asset(image),
        SizedBox(
          height: context.heigh * 0.04,
        ),
        Text(
          info,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorManger.defaultColor,
              fontWeight: FontWeightManger.regular),
        ),
        SizedBox(
          height: context.heigh * 0.04,
        ),
      ],
    );
  }
}
