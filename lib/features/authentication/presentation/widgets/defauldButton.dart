import 'package:brain_tumor/core/utils/color_mange.dart';
import 'package:brain_tumor/core/utils/mediaQuery.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function()? submit;
  final double width;
  const DefaultButton({super.key, this.title, this.submit, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:  width,
      height: context.heigh * 0.06,
      child: ElevatedButton(
        onPressed: submit,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            backgroundColor:
                MaterialStateProperty.all(ColorManger.defaultColor)),
        child: Text(
          title!,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}