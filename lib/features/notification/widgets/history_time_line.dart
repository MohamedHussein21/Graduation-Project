import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_mange.dart';
import '../../../core/utils/font_mange.dart';

class HistoryTimeLine extends StatelessWidget {
  const HistoryTimeLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: ColorManger.grayColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Normal',
                  style: TextStyle(
                      fontSize: 18,
                      color: ColorManger.defaultColor,
                      fontWeight: FontWeightManger.bold),
                ),
                Icon(Icons.download)
              ],
            ),
            Divider(),
            Row(
              children: [
                const Icon(Icons.date_range),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Text('July 18 ,08:28 pm',
                    style: TextStyle(color: ColorManger.defaultColor))
              ],
            ),
            Divider(),
            Row(
              children: [
                const Icon(Icons.av_timer),
                SizedBox(
                  width: context.width * 0.05,
                ),
                Text('20 days ago',
                    style: TextStyle(color: ColorManger.defaultColor))
              ],
            ),
            Divider(),
            TextFormField(
              maxLines: 3,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Write your Comment',
                labelStyle: TextStyle(color: ColorManger.defaultColor),
                prefixIcon: const Icon(
                  Icons.textsms_outlined,
                ),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
