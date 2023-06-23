import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/constant.dart';
import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/features/forget_Password/pages/verification_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/validator.dart';
import '../../authentication/presentation/widgets/defauldButton.dart';
import '../../authentication/presentation/widgets/defaultFormField.dart';
import '../widgets/custom_verification_shap.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with Validations {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.toPadding),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                CustomVerificationShap(
                  address: 'Forget Password',
                  image: ImageAssets.message,
                  info: '''Please enter your email address to reset the 
                      password. A 4-digit code will be sent 
                        to you for confirmation.''',
                ),
                DefaultTextForm(
                    isPassword: false,
                    type: TextInputType.emailAddress,
                    validate: emailValidation,
                    label: 'E-mail',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefix: Icons.email_outlined),
                SizedBox(
                  height: context.heigh * 0.04,
                ),
                DefaultButton(
                  width: context.width,
                  submit: () {
                    Constants.navigateTo(context, const VerificationScreen());
                  },
                  title: 'Sent Code',
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
