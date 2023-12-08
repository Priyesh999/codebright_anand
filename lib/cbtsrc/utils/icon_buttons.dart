import 'package:flutter/material.dart';

class CboIconBtn extends StatelessWidget {
  Widget? child;
  Color? color;
  VoidCallback? onPress;

  CboIconBtn({this.child, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: color!, width: 0.5),
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child: child,
      ),
      onPressed: onPress,
    );
  }
}
