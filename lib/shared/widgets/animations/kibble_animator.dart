import 'package:flutter/cupertino.dart';

class KibbleAnimator extends StatelessWidget {
  const KibbleAnimator({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.linearToEaseOut,
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          child: child,
          scale: animation,
        ),
      ),
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
