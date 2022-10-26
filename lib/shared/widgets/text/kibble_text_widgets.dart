import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';

class KibbleTextWidgets {
  Widget kibbleDefaultText(String text, double scaleFactor) {
    return Text(
      text,
      textScaleFactor: scaleFactor,
      style: TextStyle(color: KibbleColors.text, fontWeight: FontWeight.w600),
    );
  }
}
