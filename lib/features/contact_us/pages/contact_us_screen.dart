import 'package:brain_tumor/core/utils/images_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:brain_tumor/core/utils/validator.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_mange.dart';
import '../../authentication/presentation/widgets/defauldButton.dart';
import '../../authentication/presentation/widgets/defaultFormField.dart';
import '../../forget_Password/widgets/default_appBar.dart';

class ContactUSScreen extends StatefulWidget {
  const ContactUSScreen({Key? key}) : super(key: key);

  @override
  State<ContactUSScreen> createState() => _ContactUSScreenState();
}

class _ContactUSScreenState extends State<ContactUSScreen> with Validations {
  final GlobalKey<FormState> formKey = GlobalKey();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var massageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(text: 'Contact Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.toPadding),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(child: Image.asset(ImageAssets.contactUs)),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                DefaultTextForm(
                    controller: nameController,
                    isPassword: false,
                    type: TextInputType.name,
                    validate: generalValidation,
                    label: 'Full Name',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefix: Icons.person_2_outlined),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                DefaultTextForm(
                    controller: emailController,
                    isPassword: false,
                    type: TextInputType.emailAddress,
                    validate: emailValidation,
                    label: 'E-mail',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefix: Icons.email_outlined),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                DefaultTextForm(
                    controller: phoneController,
                    isPassword: false,
                    type: TextInputType.phone,
                    validate: phoneValidation,
                    label: 'Phone Number',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefix: Icons.phone_outlined),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                TextFormField(
                  maxLines: 7,
                  minLines: 1,
                  maxLength: 500,
                  controller: massageController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Write your massage',
                    labelStyle: TextStyle(color: ColorManger.defaultColor),
                    prefixIcon: const Icon(
                      Icons.textsms_outlined,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                Text(
                  'Write your message here and a support team will contact you shortly.',
                  style: TextStyle(fontSize: 15, color: ColorManger.defaultColor),
                ),
                SizedBox(
                  height: context.heigh * 0.03,
                ),
                DefaultButton(
                  width: context.width,
                  title: 'Sent Massage',
                  submit: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
