import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/core/utils/validator.dart';
import 'package:brain_tumor/features/forget_Password/widgets/default_appBar.dart';
import 'package:flutter/material.dart';


import '../../../../core/utils/color_mange.dart';
import '../../../authentication/presentation/widgets/defaultFormField.dart';
import '../widgets/history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with Validations {
  final GlobalKey<FormState> formKey = GlobalKey();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: defaultAppBar(text: 'History'),
          body: Padding(
            padding: EdgeInsets.all(context.toPadding),
            child: Column(
              children: [
                DefaultTextForm(
                    controller: searchController,
                    isPassword: false,
                    type: TextInputType.text,
                    validate: generalValidation,
                    label: 'Search',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefix: Icons.search),
                SizedBox(height: context.heigh * 0.03,),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>  HistoryItems() ,
                      itemCount: 5),
                )

              ],
            ),
          ),
        );

  }
}

