import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/images_mange.dart';
import '../../../authentication/presentation/widgets/defauldButton.dart';
import '../../../patient-data/presentation/pages/patient_data.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(15),
      content: SizedBox(
        height: context.heigh * 0.3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: ColorManger.defaultColor.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: ColorManger.wightColor,
                      )),
                )
              ],
            ),
            Image.asset(ImageAssets.choose),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                DefaultButton(
                  width: context.width * 0.30,
                  title: 'New Patient',
                  submit: () {
                    Constants.navigateTo(context,   const PatientData(isNew: true,));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                DefaultButton(
                  width: context.width * 0.30,
                  title: 'Old Patient',
                  submit: () {
                    Constants.navigateTo(context,   const PatientData(isNew: false,));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


