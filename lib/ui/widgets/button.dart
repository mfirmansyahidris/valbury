import 'package:flutter/material.dart';
import 'package:valbury/ui/ui.dart';

class Button extends StatelessWidget {
  final String title;
  final Widget? leading;
  final VoidCallback? onPressed;
  final bool enabled;
  final double? width;
  final Color color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final EdgeInsets? padding;
  final double? height;
  final bool showShadow;
  final double? verticalMargin;

  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.leading,
    this.width,
    this.color = Palette.primary,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    this.padding,
    this.height,
    this.showShadow = true,
    this.verticalMargin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _color = color;
    Color _titleColor = titleColor ?? Palette.white;

    if(!enabled){
      _color = Palette.disable;
      _titleColor = Palette.textAlt;
    }

    Widget text = Text(
      title.toUpperCase(),
      style: TextStyles.h6.copyWith(
        color: _titleColor,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
    Widget content = text;
    if(leading != null){
      content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ?? const SizedBox(),
          SpacerH(value: Dimens.space8,),
          text
        ],
      );
    }
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(vertical: verticalMargin ?? Dimens.space8),
      decoration: BoxDecoration(
        boxShadow: showShadow ? [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 13,
            offset: const Offset(0, 3),
          )
        ] : null,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
          backgroundColor: _color,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: Dimens.space16,
                vertical: Dimens.space6,
              ),
          shape: const StadiumBorder(),
        ),
        child: content,
      ),
    );
  }
}
