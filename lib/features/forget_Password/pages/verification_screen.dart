import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../core/utils/color_mange.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/images_mange.dart';
import '../../authentication/presentation/widgets/defauldButton.dart';
import '../widgets/custom_verification_shap.dart';
import 'new_password.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(context.toPadding),
        child: SingleChildScrollView(
          child: Column(children: [
            CustomVerificationShap(
              address: 'Verification',
              image: ImageAssets.verification,
              info: '''Please enter the 4-digit code
                    sent to ElKheir_Hospital@gmail.com''',
            ),
            OtpTextField(
              borderRadius: BorderRadius.circular(10),
              fieldWidth: 55,
              numberOfFields: 4,
              borderColor: ColorManger.defaultColor,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (value) {}, // end onSubmit
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn\'t receive the code ?',
                    style: TextStyle(color: ColorManger.darkColor)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: TextStyle(color: ColorManger.defaultColor),
                    )),
              ],
            ),
            SizedBox(
              height: context.heigh * 0.04,
            ),
            DefaultButton(
              width: context.width,
              submit: () {
                Constants.navigateTo(context, const NewPasswordScreen());
              },
              title: 'Confirm',
            )
          ]),
        ),
      ),
    );
  }
}
