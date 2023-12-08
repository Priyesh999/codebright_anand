import 'package:digigyan/cbtsrc/utils/app_decoration.dart';
import 'package:digigyan/cbtsrc/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'codebright_text.dart';


class CodebrightBrightButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color bgColor;
  final Color textColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  const CodebrightBrightButton(
      {Key? key ,
      required this.onPressed,
      required this.text,
      this.borderColor = Colors.black,
        this.padding,
      this.bgColor =  Colors.white,
      this.textColor = Colors.white,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * 0.9,
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          textStyle: TextStyle(fontSize: textSize != null ? getSize(textSize, context) : getSize(16, context)),
          backgroundColor: bgColor ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.black87, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(false, getSize(textSize??18, context),
              fontWeight: FontWeight.bold, textColor: textColor ?? Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

