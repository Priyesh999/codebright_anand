import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/app_decoration.dart';
import 'package:digigyan/cbtsrc/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DxTextWhite extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;

  DxTextWhite(this.mTitle, {this.mBold = false, this.mSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      style:
          AppStyles.getTextStyleWhite(this.mBold, getSize(this.mSize, context)),
    );
  }
}

class DxTextBlack extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;
  TextAlign? textAlign;
  FontWeight fontWeight;
  TextOverflow overflow;
  int? maxLine;

  DxTextBlack(this.mTitle,
      {this.textAlign,
      this.maxLine = 1,
      this.overflow = TextOverflow.ellipsis,
      this.mBold = false,
      this.mSize = 16,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.mTitle,
      overflow: overflow,
      maxLines: maxLine,
      style: this.mBold
          ? AppStyles.getTextStyle(this.mBold, getSize(this.mSize, context),
              fontWeight: this.fontWeight)
          : AppStyles.getTextStyle(this.mBold, getSize(this.mSize, context)),
      textAlign: textAlign,
    );
  }
}

class CBTText extends StatelessWidget {
  String mTitle;
  bool mBold;
  double mSize;
  TextAlign? textAlign;
  FontWeight fontWeight;
  TextOverflow overflow;
  int? maxLine;
  Color? color;

  CBTText(this.mTitle,
      {this.textAlign,
      this.maxLine = 1,
      this.overflow = TextOverflow.ellipsis,
      this.mBold = false,
      this.mSize = 16,
      this.fontWeight = FontWeight.w600,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(mTitle,
        maxLines: maxLine,
        style: TextStyle(
          color: color,
          fontFamily: 'poppins-medium',
          fontWeight: fontWeight,
          fontSize: mSize,
        ));
  }
}

class CBTTextNew extends StatelessWidget {
  String mTitle;
  TextAlign? textAlign;
  TextOverflow overflow;
  TextStyle? style;
  int? maxLine;
  bool mBold;
  double mSize;
  Color? color;
  bool? isBlink;

  CBTTextNew(this.mTitle,
      {this.textAlign,
      this.maxLine = 6,
      this.mBold = false,
      this.mSize = 14,
      this.color,
      this.overflow = TextOverflow.ellipsis,
      this.style});

  @override
  void initState() {
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(mTitle,
        maxLines: maxLine,
        textAlign: textAlign,
        overflow: overflow,
        style: style == null ? TStyle.f14_M.style : style);
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(seconds: 1),
    this.deltaX = 20,
    this.curve = Curves.linear,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, widget.deltaX * shake(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}
