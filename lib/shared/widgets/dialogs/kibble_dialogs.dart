import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/widgets/icons/kibble_icons.dart';
import 'package:kibble/shared/widgets/text/kibble_text_widgets.dart';

class KibbleDialogs {
  Future<void> showSuccessDialog(String message, BuildContext context) async {
    final _snack = SnackBar(
      backgroundColor: KibbleColors.altBackground,
      content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KibbleIcons()
                .kibbelIconDefault(icon: Icons.thumb_up_alt, context: context),
            KibbleTextWidgets().kibbleDefaultText(message, 1)
          ]),
    );

    ScaffoldMessenger.of(context).showSnackBar(_snack);
  }

  Future<void> showErrorDialog(String message, BuildContext context) async {
    final _snack = SnackBar(
      backgroundColor: KibbleColors.altBackground,
      content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            KibbleIcons()
                .kibbelIconDefault(icon: Icons.error, context: context),
            KibbleTextWidgets().kibbleDefaultText(message, 1)
          ]),
    );

    ScaffoldMessenger.of(context).showSnackBar(_snack);
  }
}
