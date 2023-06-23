import 'package:flutter/material.dart';

import '../../../core/utils/color_mange.dart';
import '../../../core/utils/font_mange.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'El Kheir Hospital ',
              style: TextStyle(
                  fontSize: 18,
                  color: ColorManger.defaultColor,
                  fontWeight: FontWeightManger.bold),
            ),
            Text('2 Min ',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManger.defaultColor,
                )),
          ],
        ),
        Text(
            '''Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua.Ut enim ad minim veniam ''',
            style: TextStyle(
              fontSize: 14,
              color: ColorManger.defaultColor,
            )),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
