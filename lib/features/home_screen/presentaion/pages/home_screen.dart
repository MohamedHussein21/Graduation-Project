import 'package:brain_tumor/core/utils/font_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/images_mange.dart';

import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../widgets/dailog.dart';
import '../widgets/drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    endDrawer:  const BuildDrawer(),
      appBar: AppBar(
        leading: Image.asset(
          ImageAssets.logo,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.toPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManger.defaultColor,
                    fontWeight: FontWeightManger.bold),
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              Image.asset(
                ImageAssets.dashboard,
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              Text(
                'Service',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManger.defaultColor,
                    fontWeight: FontWeightManger.bold),
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              SizedBox(
                height: context.heigh * 0.26,
                width: context.width * 0.6,
                child: Card(
                  elevation: 5,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              ImageAssets.brain,
                              scale: 0.7,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.heigh * 0.02,
                        ),
                        Text(
                          'Feel free to generate a report.',
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorManger.defaultColor,
                              fontWeight: FontWeightManger.bold),
                        ),
                        SizedBox(
                          height: context.heigh * 0.02,
                        ),
                        DefaultButton(
                          submit: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const CustomDialog();
                              },
                            );
                          },
                          title: 'Upload  MRI',
                          width: context.width * 0.4,
                        )
                      ],
                    ),
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
