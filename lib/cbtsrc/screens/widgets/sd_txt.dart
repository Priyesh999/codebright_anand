import 'package:flutter/material.dart';

class SdRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final bool bold;
  final double fontSize;
  final TextAlign? textAlign;
  final Color txt1Color;
  final Color txt2Color;
  final Color txt3Color;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final bool isFirst;

  const SdRichText(this.text2, {
    this.textAlign,
    this.text1 = "",
    this.text3 = "",
    this.bold = false,
    this.fontSize = 14,
    this.maxLines = 1,
    this.isFirst = false,
    this.fontWeight = FontWeight.w500,
    this.overflow = TextOverflow.ellipsis,
    this.txt1Color = Colors.red,
    this.txt2Color = Colors.black,
    this.txt3Color = Colors.red,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          fontSize: fontSize,
          color: txt1Color,
          fontWeight: fontWeight,
        ),
        children: <TextSpan>[
          TextSpan(

            text:text2,
            style: TextStyle(
              fontSize: fontSize,
              color:txt2Color,
              fontWeight: fontWeight,
            ),
          ),

          TextSpan(
            text:"   " +text3,
            style: TextStyle(
              fontSize: fontSize,
              color:txt3Color,
              fontWeight: fontWeight,
            ),
          )
        ],
      ),
    );
  }
}


class SdText extends StatelessWidget {
  final String text;
  final bool bold;
  final double fontSize;
  final Color textColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  const SdText(this.text, {
    this.bold = false,
    this.maxLines = 1,
    this.textAlign,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.overflow = TextOverflow.ellipsis,
    this.textColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontWeight: fontWeight,
      ),
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}