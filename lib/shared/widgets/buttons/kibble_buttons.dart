import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/styling/kibble_radius.dart';
import 'package:kibble/shared/widgets/icons/kibble_icons.dart';

class KibbleButton extends StatelessWidget {
  const KibbleButton({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(KibbleRadius.defaultBorderRadius),
      color: KibbleColors.altBackground,
      child: InkWell(
        borderRadius: BorderRadius.circular(KibbleRadius.defaultBorderRadius),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: KibbleIcons().kibbelIconDefault(icon: icon, context: context),
        ),
      ),
    );
  }
}
