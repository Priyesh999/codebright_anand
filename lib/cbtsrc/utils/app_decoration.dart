import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:flutter/material.dart';

import 'get_size.dart';

InputDecoration cboTextFieldDecoration(
  BuildContext context, {
  EdgeInsetsGeometry? roundPadding,
  String? hint,
  Icon? prefixIcon,
  Icon? suffixIcon,
  double textSize = 14,
  Color fillColor = Colors.white,
  bool isFilled = false,
  bool displayBorder = true,
  double radius = 0.0,
  Color? borderColor,
  Color? focusColor,
  double? hintTextSize,
  bool showDefaultPrefixIcon = false,
  bool showLabel = true,
}) {
  borderColor ??= CodebrightColor.cbtPrimarColor;
  focusColor ??= CodebrightColor.cbtPrimarColor;
  const double _defaultBorderWidth = 1.2;
  const double _focusedBorderWidth = 1.7;

  // borderColor = Colors.green;
  // focusColor = Colors.red;
  return InputDecoration(
    prefixIcon: prefixIcon != null || showDefaultPrefixIcon
        ? SizedBox(
            width: 43,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                prefixIcon ?? const Icon(Icons.edit),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey.shade300,
                )
              ],
            ),
          )
        : null,
    suffixIcon: suffixIcon,
    alignLabelWithHint: true,
    filled: isFilled,
    fillColor: fillColor,
    contentPadding: roundPadding ??
        const EdgeInsets.symmetric(vertical: 8, horizontal: 15.0),
    enabledBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor!,
              width: _defaultBorderWidth,
            ),
          )
        : InputBorder.none,
    disabledBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor!,
              width: _defaultBorderWidth,
            ),
          )
        : InputBorder.none,
    border: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor!,
              width: _defaultBorderWidth,
            ),
          )
        : InputBorder.none,
    focusedBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: focusColor!,
              width: _focusedBorderWidth,
            ),
          )
        : InputBorder.none,
    labelText: showLabel ? hint : null,
    hintText: showLabel ? null : hint,
    hintStyle: TextStyle(fontSize: hintTextSize ?? 14),
    labelStyle: TextStyle(
      color: Colors.grey.shade700,
      fontSize: getSize(textSize, context),
      // fontFamily: AppFonts.textRegular,
      fontWeight: FontWeight.normal,
    ),
  );
}

class AppStyles {
  AppStyles._();

  static getTextStyle(bool isSemiBold, double fontSize,
          {FontWeight fontWeight = FontWeight.w400, Color? color}) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w600 : fontWeight,
        color: color ?? Colors.blueGrey.shade900,
        fontSize: fontSize,
        fontFamily:
            isSemiBold ? AppFontsNeo.leagueSemiBold : AppFontsNeo.leagueRegular,
      );

  static getTextStrikeThrough(bool isSemiBold, double fontSize,
          {Color? textColor}) =>
      TextStyle(
        // fontFamily: isSemiBold ? AppFonts.textSemiBold : AppFonts.textRegular,
        color: textColor,
        fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.normal,
        fontSize: fontSize,
        decoration: TextDecoration.lineThrough,
      );

  static getTextStyleColor(bool isSemiBold, double fontSize,
          {Color? textColor, FontWeight fontWeight = FontWeight.w500}) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : fontWeight,
        color: textColor,
        fontSize: fontSize,
      );

  static getTextStylePrimary(bool isSemiBold, double fontSize) => TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: CodebrightColor.cbtPrimarColor,
        fontSize: fontSize,
      );

  static getTextStyleGreen(bool isSemiBold, double fontSize) => TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: CodebrightColor.cbtPrimarColor,
        fontSize: fontSize,
      );

  static getTextStyleRed(bool isSemiBold, double fontSize) => TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: Colors.redAccent,
        fontSize: fontSize,
      );

  static getTextStyleWhite(bool isSemiBold, double fontSize) => TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: Colors.white,
        fontSize: fontSize,
      );

  static getTextStyleDefaultColor(bool isSemiBold, double fontSize) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        fontSize: fontSize,
      );
}

//--------------------- Experimental --------------------------
const Color food_ShadowColor = Color(0X95E9EBF0);
const Color food_color_gray = Color(0xFFFAFAFA);
const Color food_ShadowColors = Color(0XFFE2E2E2);

BoxDecoration gradientBoxDecoration({
  double radius = 8.0,
  Color color = Colors.transparent,
  Color gradientColor2 = Colors.white,
  Color gradientColor1 = Colors.white,
  var showShadow = false,
}) {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [gradientColor1, gradientColor2]),
    boxShadow: showShadow
        ? [
            const BoxShadow(
                color: food_ShadowColor, blurRadius: 10, spreadRadius: 2)
          ]
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

var shadowColorGlobal = Colors.black12;

class AppDecoration {
  BoxDecoration boxDecoration(
      {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor = Colors.white,
      var showShadow = false}) {
    return BoxDecoration(
      color: bgColor,
      boxShadow: showShadow
          ? [
              BoxShadow(
                  color: shadowColorGlobal, blurRadius: 5, spreadRadius: 1)
            ]
          : [const BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  static getInputDecoration(String labelHint) => InputDecoration(
      labelText: labelHint,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      border: const OutlineInputBorder(borderSide: BorderSide(width: 1.4)),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(width: 1.6)));

  static getInputDecorationNoLine(String labelHint) => InputDecoration(
      labelText: labelHint,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      border: InputBorder.none,
      focusedBorder: InputBorder.none);

  static getOutLineBoxDecoration([
    Color? color,
  ]) =>
      BoxDecoration(
          border: Border.all(
        color: color ?? Colors.black87,
      ));

  static getBoxGradientDecoration() => BoxDecoration(
      // Box decoration takes a gradient
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green[50]!, Colors.white]));

  static getBoxRoundDecoration({Color bColor = Colors.black45}) =>
      BoxDecoration(
          border: Border.all(width: 1, color: bColor),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white);

  static getRoundRectangleDecoration() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

  static getRoundRectangleDecorationColor({Color? borderColor}) =>
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: borderColor!));

  static getInputDecorationPlain(String labelHint) => InputDecoration(
        labelText: labelHint,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
      );
}
