import 'package:flutter/material.dart';
import 'package:valbury/core/core.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

class Item1 extends StatelessWidget {
  const Item1({Key? key, required this.data}) : super(key: key);

  final DataHelper data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.cornerRadius),
          color: Palette.white,
          boxShadow: [BoxShadows.card]
      ),
      padding: EdgeInsets.all(Dimens.space16),
      child: Row(
        children: [
          ImageNetwork(
            imageUrl: data.url ?? "",
            height: context.widthInPercent(15),
            width: context.widthInPercent(15),
          ),
          SpacerH(value: Dimens.space16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title ?? "-",
                  style: TextStyles.h6,
                ),
                SpacerV(value: Dimens.space10,),
                Text(data.desc ?? "-",
                  style: TextStyles.body2,
                )
              ],
            ),
          ),
          SpacerH(value: Dimens.space16,),
          Text(
            Strings.get.viewDetail,
            style: TextStyles.body2.copyWith(
                color: Palette.primary
            ),
          )
        ],
      ),
    );
  }
}
