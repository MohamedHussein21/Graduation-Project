import 'package:flutter/material.dart';

AppBar defaultAppBar({required String text}) {
  return AppBar(
    title:  Text(text),
    elevation: 2,
  );
}