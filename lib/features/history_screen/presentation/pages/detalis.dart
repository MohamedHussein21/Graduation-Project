import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/font_mange.dart';
import '../../../notification/widgets/history_time_line.dart';



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.gradientAppBar(txt: 'Mohamed Hussein'),
      body: Padding(
        padding: EdgeInsets.all(context.toPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('232323'),
                  prefixIcon: Icon(Icons.call_to_action),
                ),
              ),
              SizedBox(
                height: context.heigh * 0.02,
              ),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('0102111111'),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: context.heigh * 0.02,
              ),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  label: Text('11/12/2020'),
                  prefixIcon: Icon(Icons.date_range),
                ),
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              Text(
                'Time Line',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManger.defaultColor,
                    fontWeight: FontWeightManger.bold),
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              TimelineTile(
                nodeAlign: TimelineNodeAlign.start,
                contents: const HistoryTimeLine(),
                node: const TimelineNode(
                  indicator: DotIndicator(
                    color: Colors.green,
                  ),
                  startConnector: SolidLineConnector(
                    color: Colors.grey,
                  ),
                  endConnector: SolidLineConnector(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

