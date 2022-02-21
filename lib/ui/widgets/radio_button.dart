import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class RadioButton<T> extends StatefulWidget {
  const RadioButton({
    Key? key,
    required this.title,
    this.fontSize,
    required this.onChanged,
    required this.value,
    required this.valueGroup,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.isBold = false,
    this.radioColor
  }) : super(key: key);
  final String title;
  final double? fontSize;
  final VoidCallback onChanged;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final bool isBold;
  final dynamic value;
  final dynamic valueGroup;
  final Color? radioColor;

  @override
  _RadioButtonState createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      children: [
        SizedBox(
          width: Dimens.space24,
          child: Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: widget.radioColor,
            ),
            child: Transform.scale(
              scale: Dimens.space2 / 2.4,
              child: Radio<T>(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.comfortable,
                groupValue: widget.valueGroup,
                value: widget.value,
                activeColor: widget.radioColor ?? Palette.primary,
                onChanged: (value) {
                  widget.onChanged();
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: Dimens.space8,
        ),
        GestureDetector(
          onTap: widget.onChanged,
          child: Text(
            widget.title,
            style: TextStyles.body2.copyWith(
              fontSize: widget.fontSize,
              color: widget.radioColor ?? Palette.text,
              fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
