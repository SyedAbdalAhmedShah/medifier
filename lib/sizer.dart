import 'package:flutter/material.dart';

class size {
  static convert(BuildContext context, double n) {
    double i = (n) / 683;
    return i * MediaQuery.of(context).size.longestSide;
  }

  static convertWidth(BuildContext context, double n) {
    double i = (n) / 411;
    return i * MediaQuery.of(context).size.width;
  }
}
