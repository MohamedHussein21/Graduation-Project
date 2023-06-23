import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/notification/widgets/widgets.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Constants.gradientAppBar(txt: 'Notification'),
      body: Padding(
        padding: EdgeInsets.all(context.toPadding),
        child: Column(
          children: [
            ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) => const NotificationItem(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 3),
          ],
        ),
      ),
    );
  }

}

