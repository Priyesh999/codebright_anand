import 'package:flutter/material.dart';
import 'app_color.dart';
import 'fonts.dart';

enum TStyle {
  f8_B,
  f8_S,
  f8_M,
  f8_T,
  f8_R,
  f8_L,
  f7_B,
  f7_S,
  f7_M,
  f7_T,
  f7_R,
  f7_L,
  f10_B,
  f10_S,
  f10_M,
  f10_T,
  f10_R,
  f10_L,
  f11_B,
  f11_S,
  f11_M,
  f11_T,
  f11_R,
  f11_L,
  f12_B,
  f12_S,
  f12_M,
  f12_T,
  f12_R,
  f12_L,
  f14_B,
  f14_S,
  f14_M,
  f14_T,
  f14_R,
  f14_L,
  f16_B,
  f16_S,
  f16_M,
  f16_T,
  f16_R,
  f16_L,
  f18_B,
  f18_S,
  f18_M,
  f18_T,
  f18_R,
  f18_L,
  f20_B,
  f20_S,
  f20_M,
  f20_T,
  f20_R,
  f20_L,
}

extension TextStylesHandler on TStyle {
  TextStyle get style => _TextStyles.mobileStyles[this]!;

  TextStyle styleWith(
      {Color? color = CodebrightColor.fontColor,
      String fontFamily = "",
      FontWeight? fontWeight = FontWeight.normal}) {
    if (fontFamily.isNotEmpty) {
      return style.copyWith(
          color: color, fontFamily: fontFamily, fontWeight: fontWeight,);
    } else {
      if (fontWeight != null) {
        return style.copyWith(color: color, fontWeight: fontWeight);
      } else {
        return style.copyWith(color: color);
      }
    }
  }
}

abstract class _TextStyles implements CodebrightColor, AppFontsNeo {
  static double extraSize=2;

  static final Map<TStyle, TextStyle> mobileStyles = {
    TStyle.f7_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f7_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f7_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f7_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f7_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f7_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 7+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 8+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 8+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 8+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 8+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 8,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f8_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 8,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f10_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 10+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f12_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 12+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f11_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 11+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_R: TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f14_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 14+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f16_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 16+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_S:  TextStyle(
      fontFamily: AppFontsNeo.montserratSemiBold,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_B:  TextStyle(
      fontFamily: AppFontsNeo.montserratBold,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_L:  TextStyle(
      fontFamily: AppFontsNeo.montserratLight,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_T:  TextStyle(
      fontFamily: AppFontsNeo.montserratThin,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_R:  TextStyle(
      fontFamily: AppFontsNeo.montserratRegular,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
    TStyle.f18_M:  TextStyle(
      fontFamily: AppFontsNeo.montserratMedium,
      fontSize: 18+extraSize,
      color: CodebrightColor.fontColor,
    ),
  };
}
