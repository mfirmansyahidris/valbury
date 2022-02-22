import 'package:flutter/material.dart';
import 'package:valbury/ui/ui.dart';

class Progress extends StatelessWidget {
  final double? size;
  final Color? color;
  final EdgeInsets? margin;

  const Progress({
    Key? key,
    this.size,
    this.color,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size ?? Dimens.space24,
          width: size ?? Dimens.space24,
          margin: margin ?? EdgeInsets.all(Dimens.space20),
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color ?? Palette.primary),
          ),
        )
      ],
    );
  }
}