import 'package:flutter/material.dart';



class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.settings,
      ),
    );
  }
}
