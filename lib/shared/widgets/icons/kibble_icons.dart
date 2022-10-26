import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';

class KibbleIcons {
  Widget kibbelIconLarge(
      {required IconData icon, required BuildContext context}) {
    return Icon(
      icon,
      color: KibbleColors.accent,
      size: MediaQuery.of(context).size.width / 10,
    );
  }

  Widget kibbelIconDefault(
      {required IconData icon, required BuildContext context}) {
    return Icon(
      icon,
      color: KibbleColors.accent,
      size: MediaQuery.of(context).size.width / 15,
    );
  }
}
