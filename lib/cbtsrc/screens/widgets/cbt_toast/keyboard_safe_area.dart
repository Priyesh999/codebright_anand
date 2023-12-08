import 'package:flutter/material.dart';

//This class is used based on the offset distance from the bottom of the screen is 0
class KeyboardSafeArea extends StatelessWidget {
  final Widget? child;

  final bool? enable;

  const KeyboardSafeArea({Key? key, this.child, this.enable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!(enable!)) {
      return child!;
    }
    MediaQueryData data = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: data.viewInsets.bottom),
      child: child,
    );
  }
}
