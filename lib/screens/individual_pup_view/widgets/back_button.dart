import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/styling/kibble_radius.dart';
import 'package:kibble/shared/widgets/text/kibble_text_widgets.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(KibbleRadius.defaultBorderRadius),
          topRight: Radius.circular(KibbleRadius.defaultBorderRadius)),
      color: KibbleColors.accent,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(KibbleRadius.defaultBorderRadius),
            topRight: Radius.circular(KibbleRadius.defaultBorderRadius)),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Center(child: KibbleTextWidgets().kibbleDefaultText('Back', 1)),
          ),
        ),
      ),
    );
  }
}
