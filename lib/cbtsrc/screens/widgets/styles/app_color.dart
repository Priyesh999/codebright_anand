import 'package:flutter/cupertino.dart';

class CodebrightColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF03036B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primary = Color(0xFF0F0F8C);
  static Color primarySoft = Color(0xFF075249);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xFF1B1F24);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color error = Color(0xFFD00E0E);
  static Color success = Color(0xFF16AE26);
  static Color warning = Color(0xFFEB8600);
  static Color white = Color(0xFFFFFFFF);
  static const Color fontColor = Color(0xFF311B1B);
  static const Color black = Color(0xFF311B1B);
  static const Color cbtGrey = Color(0xFFABA8A8);
  static const Color cbtPrimarColor = Color(0xFF03036B);
}
