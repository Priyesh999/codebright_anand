import 'package:digigyan/cbtsrc/utils/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CBTInputText extends StatefulWidget {
  String hintText;
  String? valueText = "";
  Function()? onClick;
  Function()? onTap;
  Function(String)? onChanged;
  bool enabled;

  Widget? sufixIcon;
  TextEditingController? controller;
  bool isEditable;
  bool isUnderLine;
  TextInputType keyboardType;
  List<TextInputFormatter>? inputFormatters;
  int maxLines;
  int minLines;
  String? Function(String?)? validator;
  Icon? prefixIcon;
  bool showDefaultPrefixIcon;
  double? hintTextSize;
  bool autofocus;
  bool obscureText;
  bool isPreSelectedTextMode;
  bool readOnly;
  int borderRadius;

  CBTInputText({
    required this.hintText,
    required this.valueText,
    this.onClick,
    this.hintTextSize,
    this.onChanged,
    this.borderRadius = 2,
    this.readOnly = false,
    this.sufixIcon,
    this.enabled = true,
    this.isEditable = true,
    this.isUnderLine = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.showDefaultPrefixIcon = false,
    this.prefixIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.isPreSelectedTextMode = false,
    this.onTap,
  }) {
    controller ??= TextEditingController();

//it will make sure cursor is at the last position.
    if (valueText != null && valueText!.isNotEmpty) {
      print("NON BLANK CASE");
      controller!.value = TextEditingValue(
        text: valueText ?? "",
        selection: TextSelection.fromPosition(
          TextPosition(offset: valueText?.length ?? 0),
        ),
      );
    } else {
      print("BLANK CASE");
    }
    // controller_view_all.dart.value = TextEditingValue(
    //   text: valueText ?? "",
    //   selection: TextSelection.fromPosition(
    //     TextPosition(offset: valueText?.length ?? 0),
    //   ),
    // );

//Enable this to show text field initially selected all text.
  }

  @override
  _CBTInputTextState createState() => _CBTInputTextState();
}

class _CBTInputTextState extends State<CBTInputText> {

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEditable,
      child: InkWell(
        onTap: widget.onClick,
        child: widget.maxLines == 1
            ? SizedBox(
                height: 50,
                child: TextFormField(
                  obscureText: widget.obscureText,
                  // focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  readOnly: widget.readOnly,
                  onTap: widget.onTap,
                  validator: widget.validator,
                  minLines: this.widget.minLines,
                  keyboardType: widget.maxLines > 1
                      ? TextInputType.multiline
                      : widget.keyboardType,
                  controller: widget.controller,
                  inputFormatters: this.widget.inputFormatters,
                  maxLines: this.widget.maxLines,
                  style: TextStyle(color: Colors.black),
                  enabled: this.widget.enabled,
                  onSaved: (v) {},
                  onChanged: (query) {
                    if (this.widget.onChanged != null) {
                      this.widget.onChanged!(query);
                    }
                  },
                  decoration: widget.isUnderLine
                      ? InputDecoration(
                          hintText: this.widget.hintText,
                          hintStyle: Theme.of(context).textTheme.caption,
                        )
                      : cboTextFieldDecoration(context,
                          hintTextSize: widget.hintTextSize,
                          showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
                          hint: this.widget.hintText,
                          textSize: 14,
                          isFilled: true,
                          fillColor: this.widget.isEditable
                              ? Colors.white
                              : Colors.grey.shade200,
                          radius: widget.borderRadius.toDouble(),
                          prefixIcon: this.widget.prefixIcon),
                ),
              )
            : TextFormField(
                obscureText: widget.obscureText,
                // focusNode: _focusNode,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                validator: widget.validator,
                minLines: this.widget.minLines,
                keyboardType: widget.maxLines > 1
                    ? TextInputType.multiline
                    : widget.keyboardType,
                controller: widget.controller,
                inputFormatters: this.widget.inputFormatters,
                maxLines: this.widget.maxLines,
                style: TextStyle(color: Colors.black),
                enabled: this.widget.enabled,
                onSaved: (v) {},
                onChanged: (query) {
                  if (this.widget.onChanged != null) {
                    this.widget.onChanged!(query);
                  }
                },
                decoration: widget.isUnderLine
                    ? InputDecoration(
                        hintText: this.widget.hintText,
                        hintStyle: Theme.of(context).textTheme.caption,
                      )
                    : cboTextFieldDecoration(context,
                        hintTextSize: widget.hintTextSize,
                        showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
                        hint: this.widget.hintText,
                        textSize: 14,
                        isFilled: true,
                        fillColor: Colors.white,
                        radius: widget.borderRadius.toDouble(),
                        prefixIcon: this.widget.prefixIcon),
              ),
      ),
    );
  }
}



class CBTInputTextG extends StatefulWidget {
  String hintText;
  String? valueText = "";
  Function()? onClick;
  Function()? onTap;
  Function(String)? onChanged;
  bool enabled;

  Widget? sufixIcon;
  TextEditingController? controller;
  bool isEditable;
  bool isUnderLine;
  TextInputType keyboardType;
  List<TextInputFormatter>? inputFormatters;
  int maxLines;
  int minLines;
  String? Function(String?)? validator;
  Icon? prefixIcon;
  bool showDefaultPrefixIcon;
  double? hintTextSize;
  bool autofocus;
  bool obscureText;
  bool isPreSelectedTextMode;
  bool readOnly;
  int borderRadius;

  CBTInputTextG({
    required this.hintText,
    required this.valueText,
    this.onClick,
    this.hintTextSize,
    this.onChanged,
    this.borderRadius = 2,
    this.readOnly = false,
    this.sufixIcon,
    this.enabled = true,
    this.isEditable = true,
    this.isUnderLine = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.showDefaultPrefixIcon = false,
    this.prefixIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.isPreSelectedTextMode = false,
    this.onTap,
  }) {
    controller ??= TextEditingController();

//it will make sure cursor is at the last position.
    if (valueText != null && valueText!.isNotEmpty) {
      print("NON BLANK CASE");
      controller!.value = TextEditingValue(
        text: valueText ?? "",
        selection: TextSelection.fromPosition(
          TextPosition(offset: valueText?.length ?? 0),
        ),
      );
    } else {
      print("BLANK CASE");
    }
    // controller_view_all.dart.value = TextEditingValue(
    //   text: valueText ?? "",
    //   selection: TextSelection.fromPosition(
    //     TextPosition(offset: valueText?.length ?? 0),
    //   ),
    // );

//Enable this to show text field initially selected all text.
  }

  @override
  _CBTInputTextStateG createState() => _CBTInputTextStateG();
}

class _CBTInputTextStateG extends State<CBTInputTextG> {

  @override
  Widget build(BuildContext context) {
    print("TEXT :-> ${widget.controller!.text}");
    return IgnorePointer(
//key: Key(this.hintText),
      ignoring: !widget.isEditable,
      child: InkWell(
        onTap: widget.onClick,
        child: widget.maxLines == 1
            ? SizedBox(
          height: 40,
          child: TextFormField(
            obscureText: widget.obscureText,
            // focusNode: _focusNode,
            autofocus: widget.autofocus,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            validator: widget.validator,
            minLines: this.widget.minLines,
            keyboardType: widget.maxLines > 1
                ? TextInputType.multiline
                : widget.keyboardType,
            controller: widget.controller,
            inputFormatters: this.widget.inputFormatters,
            maxLines: this.widget.maxLines,
            style: TextStyle(color: Colors.black),
            enabled: this.widget.enabled,
            onSaved: (v) {},
            onChanged: (query) {
              if (this.widget.onChanged != null) {
                this.widget.onChanged!(query);
              }
            },
            decoration: widget.isUnderLine
                ? InputDecoration(
              hintText: this.widget.hintText,
              hintStyle: Theme.of(context).textTheme.caption,
            )
                : cboTextFieldDecoration(context,
                hintTextSize: widget.hintTextSize,
                showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
                hint: this.widget.hintText,
                textSize: 14,
                isFilled: true,
                fillColor: this.widget.isEditable
                    // ? Colors.white
                    ? Colors.grey.shade200
                    : Colors.grey.shade200,
                radius: widget.borderRadius.toDouble(),
                prefixIcon: this.widget.prefixIcon),
          ),
        )
            : TextFormField(
          obscureText: widget.obscureText,
          // focusNode: _focusNode,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          validator: widget.validator,
          minLines: this.widget.minLines,
          keyboardType: widget.maxLines > 1
              ? TextInputType.multiline
              : widget.keyboardType,
          controller: widget.controller,
          inputFormatters: this.widget.inputFormatters,
          maxLines: this.widget.maxLines,
          style: TextStyle(color: Colors.black),
          enabled: this.widget.enabled,
          onSaved: (v) {},
          onChanged: (query) {
            if (this.widget.onChanged != null) {
              this.widget.onChanged!(query);
            }
          },
          decoration: widget.isUnderLine
              ? InputDecoration(
            hintText: this.widget.hintText,
            hintStyle: Theme.of(context).textTheme.caption,
          )
              : cboTextFieldDecoration(context,
              hintTextSize: widget.hintTextSize,
              showDefaultPrefixIcon: widget.showDefaultPrefixIcon,
              hint: this.widget.hintText,
              textSize: 14,
              isFilled: true,
              fillColor: Colors.grey.shade200,
              radius: widget.borderRadius.toDouble(),
              prefixIcon: this.widget.prefixIcon),
        ),
      ),
    );
  }
}



class CboDropDown extends StatelessWidget {
  String? hintText;
  String? valueText;
  Function()? onClick;
  Icon? prefixIcon;
  Icon? suffixIcon;
  bool? readOnly;
  TextEditingController? _controller;
  bool? isSemiBold;
  Color? borderColor;
  Color? fillColor;
  int? maxLine;
  bool? isFilled = false;
  bool isSuffixIcon;
  EdgeInsetsGeometry? roundPadding;

  CboDropDown(
      {required this.hintText,
      required this.valueText,
      required this.onClick,
      this.isSemiBold,
      this.prefixIcon,
      this.suffixIcon = const Icon(Icons.keyboard_arrow_down_sharp),
      this.fillColor = Colors.transparent,
      this.isFilled = false,
      this.borderColor,
      this.readOnly = false,
      this.isSuffixIcon = true,
      this.maxLine = 1,
      this.roundPadding}) {
    _controller = TextEditingController(text: this.valueText ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return maxLine == 1
        ? SizedBox(
            height: 40,
            child: ListTile(
              // contentPadding: EdgeInsets.zero,
              onTap: this.onClick,
              enabled: !this.readOnly!,
              tileColor: this.readOnly! ? Colors.grey.shade200 : Colors.white,
              title: TextField(
                controller: _controller,
                enabled: false,
                autofocus: true,
                maxLines: 1,
                minLines: 1,
                style: AppStyles.getTextStyle(this.isSemiBold ?? false, 14),
                decoration: isSuffixIcon?cboTextFieldDecoration(context,
                    fillColor: fillColor!,
                    isFilled: isFilled!,
                    borderColor: borderColor,
                    prefixIcon: prefixIcon,
                    hint: this.hintText,
                    textSize: 14,
                    radius: 3,
                    suffixIcon: suffixIcon,
                    roundPadding: roundPadding):cboTextFieldDecoration(context,
                    fillColor: fillColor!,
                    isFilled: isFilled!,
                    borderColor: borderColor,
                    prefixIcon: prefixIcon,
                    hint: this.hintText,
                    textSize: 14,
                    radius: 3,
                    roundPadding: roundPadding),
              ),
            ),
          )
        : ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: this.onClick,
            enabled: !this.readOnly!,
            tileColor: this.readOnly! ? Colors.grey.shade200 : Colors.white,
            title: TextField(
              controller: _controller,
              enabled: false,
              autofocus: true,
              maxLines: 1,
              minLines: 1,
              style: AppStyles.getTextStyle(this.isSemiBold ?? false, 14,
                  color: Colors.black),
              decoration: cboTextFieldDecoration(context,
                  fillColor: fillColor!,
                  isFilled: isFilled!,
                  borderColor: borderColor,
                  prefixIcon: prefixIcon,
                  hint: this.hintText,
                  textSize: 14,
                  radius: 3,
                  suffixIcon: suffixIcon,
                  roundPadding: roundPadding),
            ),
          );
  }
}
