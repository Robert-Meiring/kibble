import 'package:flutter/material.dart';
import 'package:kibble/shared/widgets/icons/kibble_icons.dart';
import 'package:kibble/shared/widgets/text/kibble_text_widgets.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: KibbleTextWidgets().kibbleDefaultText('K I B B L E', 2)),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: KibbleIcons()
                .kibbelIconLarge(icon: Icons.pets_rounded, context: context))
      ],
    );
  }
}
