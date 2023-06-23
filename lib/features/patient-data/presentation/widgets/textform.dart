
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_mange.dart';

TextFormField buildTextFormField(Icon icon,
    String lableTex,
    TextInputType type,
    GestureTapCallback ontap,
    TextEditingController controller,
    FormFieldValidator validat,) {
  return TextFormField(
    validator: validat,
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: icon,
      labelText: lableTex,
    ),
    keyboardType: type,
    onSaved: (String? value) {
      // This optional block of code can be used to run
      // code when the user saves the form.
    },
    onTap: ontap,
  );
}


InkWell buildfixedform(BuildContext context,
    {GestureTapCallback? onTap, String? text, Widget? widget}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          widget!,
          SizedBox(
            width: context.width * 0.05,
          ),
          Text(
            text!,
            style: TextStyle(color: ColorManger.defaultColor),
          )
        ],
      ),
    ),
  );
}