import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/history_screen/data/models/historyModel.dart';
import 'package:brain_tumor/features/history_screen/presentation/cubit/history_cubit.dart';
import 'package:brain_tumor/features/history_screen/presentation/cubit/history_state.dart';
import 'package:brain_tumor/features/patient-data/data/models/patientModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/font_mange.dart';
import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../pages/detalis.dart';



class HistoryItems extends StatelessWidget {
  const HistoryItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(),
      child: BlocConsumer<HistoryCubit,HistoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return  Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                      ),
                      SizedBox(width: context.width * 0.05,),
                      Column(
                        children: [
                          Text(
                            'Mohamed',
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorManger.defaultColor,
                                fontWeight: FontWeightManger.bold),
                          ), const Text('#1112222 ')
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      SizedBox(width: context.width * 0.05,),

                      Text('July 18 ,08:28 pm',
                          style: TextStyle(color: ColorManger.defaultColor))
                    ],
                  ),
                  SizedBox(height: context.heigh * 0.02,),

                  DefaultButton(width: 160, title: 'Detail', submit: () {
                    Constants.navigateTo(context, const DetailsScreen());
                  },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
