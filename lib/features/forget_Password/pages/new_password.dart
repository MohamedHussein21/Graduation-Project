import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/validator.dart';
import '../../authentication/presentation/pages/login_screen.dart';
import '../../authentication/presentation/widgets/defauldButton.dart';
import '../../authentication/presentation/widgets/defaultFormField.dart';
import '../widgets/default_appBar.dart';

class NewPasswordScreen extends StatelessWidget with Validations {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar( text:' Create new Password'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.toPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Your new password must be different form previous passwords.',
              style: TextStyle(fontSize: 15, color: ColorManger.defaultColor),
            ),
            SizedBox(
              height: context.heigh * 0.05,
            ),
            DefaultTextForm(
              isPassword: true,
              type: TextInputType.visiblePassword,
              validate: passwordValidation,
              label: 'Password',
              labelStyle: TextStyle(color: ColorManger.defaultColor),
              prefix: Icons.lock_open,
              suffix: Icons.visibility_off_outlined,
            ),
            Text(
              'Must be at least 8 digit',
              textAlign: TextAlign.start,
              style: TextStyle(color: ColorManger.defaultColor, fontSize: 13),
            ),
            SizedBox(
              height: context.heigh * 0.05,
            ),
            DefaultTextForm(
              isPassword: true,
              type: TextInputType.visiblePassword,
              validate: passwordValidation,
              label: ' Confirm password',
              labelStyle: TextStyle(color: ColorManger.defaultColor),
              prefix: Icons.lock_open,
              suffix: Icons.visibility_off_outlined,
            ),
            Text(
              'Both password must match',
              textAlign: TextAlign.start,
              style: TextStyle(color: ColorManger.defaultColor, fontSize: 13),
            ),
            SizedBox(
              height: context.heigh * 0.04,
            ),
            DefaultButton(
              width: context.width,
              submit: () {
                Constants.navigateTo(context, const LoginScreen());
              },
              title: 'Reset Password',
            )
          ]),
        ),
      ),
    );
  }


}
