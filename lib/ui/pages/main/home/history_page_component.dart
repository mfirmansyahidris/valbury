import 'package:flutter/material.dart';
import 'package:valbury/core/core.dart';

import 'package:valbury/ui/ui.dart';

class HistoryPageComponent extends StatefulWidget {
  const HistoryPageComponent({Key? key}) : super(key: key);

  @override
  _HistoryPageComponentState createState() => _HistoryPageComponentState();
}

class _HistoryPageComponentState extends State<HistoryPageComponent> {
  final List<DataHelper> _hospitals = [];

  @override
  void initState() {
    super.initState();
    for (var element in dummyHospitals) {
      _hospitals.add(DataHelper(
          title: element.title,
          desc: element.desc,
          url: element.url,
          type: element.type));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _hospitals.length,
      padding: EdgeInsets.all(Dimens.space20),
      itemBuilder: (context, index) => Item1(
        data: _hospitals[index],
      ),
      separatorBuilder: (context, index) => SpacerV(
        value: Dimens.space16,
      ),
    );
  }
}
