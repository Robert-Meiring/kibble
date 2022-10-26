import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';

class KibbleLoaders {
  Widget defaultKibbleLoader(BuildContext context) {
    return SpinKitSpinningLines(
      color: KibbleColors.accent,
      size: MediaQuery.of(context).size.width / 12,
    );
  }
}
