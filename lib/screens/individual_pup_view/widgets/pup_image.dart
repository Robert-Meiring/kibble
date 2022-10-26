import 'package:flutter/material.dart';
import 'package:kibble/shared/styling/kibble_colors.dart';
import 'package:kibble/shared/styling/kibble_radius.dart';
import 'package:transparent_image/transparent_image.dart';

class PupImage extends StatelessWidget {
  const PupImage({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(KibbleRadius.defaultBorderRadius),
      elevation: 8,
      color: KibbleColors.altBackground,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KibbleRadius.defaultBorderRadius),
        child: FadeInImage.memoryNetwork(
          image: url,
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
