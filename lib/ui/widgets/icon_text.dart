import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class IconText extends StatelessWidget {
  final Widget? icon;
  final String text;
  const IconText({Key? key, this.icon, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ?? const SizedBox(),
        icon != null ? SpacerH(value: Dimens.space4,) : const SizedBox(),
        Text(text, style: TextStyles.body2,)
      ],
    );
  }
}
