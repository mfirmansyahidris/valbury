import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valbury/ui/ui.dart';

class TextF extends StatefulWidget {
  const TextF(
      {Key? key,
      this.curFocusNode,
      this.nextFocusNode,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.textInputAction,
      this.obscureText,
      this.suffixIcon,
      this.controller,
      this.onTap,
      this.textAlign,
    this.enable = true,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.prefixText,
    required this.hintText,
    required this.labelText,
    this.textAlignVertical,
    this.isBold = false,
    this.labelColor,
  }) : super(key: key);

  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool enable;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIcon;
  final String? prefixText;
  final String hintText;
  final String labelText;
  final bool isBold;
  final Color? labelColor;
  final TextAlignVertical? textAlignVertical;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: TextFormField(
        key: widget.key,
        enabled: widget.enable,
        obscureText: widget.obscureText ?? false,
        focusNode: widget.curFocusNode,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign ?? TextAlign.start,
        inputFormatters: widget.inputFormatter,
        textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
        style: TextStyles.body2.copyWith(
          fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
        ),
        minLines: widget.minLine,
        maxLines: widget.maxLine,
        cursorColor: Palette.text,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          contentPadding: EdgeInsets.all(Dimens.space12),
          labelText: widget.labelText,
          labelStyle: TextStyles.body2.copyWith(
            color: widget.labelColor ?? Palette.primary,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).focusColor.withOpacity(0.5),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          filled: !widget.enable,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor.withOpacity(0.1),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor.withOpacity(0.2),
            ),
          ),
        ),
        validator: widget.validator as String? Function(String?)?,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onFieldSubmitted: (value) {
          setState(
            () {
              fieldFocusChange(
                context,
                widget.curFocusNode ?? FocusNode(),
                widget.nextFocusNode,
              );
            },
          );
        },
      ),
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
