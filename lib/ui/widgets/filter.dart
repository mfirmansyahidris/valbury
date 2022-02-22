import 'package:flutter/material.dart';
import 'package:valbury/ui/ui.dart';

class Filter extends StatelessWidget {
  final int selectedIndex;
  final List<String> filters;
  final Function(int)? onChange;

  const Filter({
    Key? key,
    required this.selectedIndex,
    required this.filters,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.space36,
      child: ListView.separated(
        itemCount: filters.length,
        padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            onChange?.call(index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.cornerRadiusXL),
                color: Palette.second
            ),
            child: Text(
              filters[index],
              style: TextStyles.h6.copyWith(
                color: Palette.white,
                fontWeight: selectedIndex == index ? FontWeight.bold : null,
                decoration: selectedIndex == index ? TextDecoration.underline : null
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SpacerH(value: Dimens.space10,),
      ),
    );
  }
}
