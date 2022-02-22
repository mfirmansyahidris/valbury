import 'package:flutter/material.dart';
import 'package:valbury/core/core.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

class HomePageComponent extends StatefulWidget {
  final Function(int)? switchToPage;
  const HomePageComponent({Key? key, this.switchToPage}) : super(key: key);

  @override
  _HomePageComponentState createState() => _HomePageComponentState();
}

class _HomePageComponentState extends State<HomePageComponent> {
  final List<String> _filters = ["SEMUA", "BPJS", "Partner", "Terdekat"];
  final List<DataHelper> _hospitals = [];
  int _filterHospital = 0;
  final List<DataHelper> _clinics = [];
  int _filterClinic = 0;

  List<DataHelper> _filteredHospital = [];
  List<DataHelper> _filteredClinic = [];

  @override
  void initState() {
    super.initState();
    for (var element in dummyHospitals) {
      _hospitals.add(DataHelper(
          title: element.title,
          desc: element.desc,
          url: element.url,
          type: element.type));
      _clinics.add(DataHelper(
          title: element.title,
          desc: element.desc,
          url: element.url,
          type: element.type));
    }
    _filteringHospital();
    _filteringClinic();
  }

  void _filteringHospital() {
    setState(() {
      if (_filterHospital == 0) {
        _filteredHospital = _hospitals;
      } else {
        _filteredHospital = _hospitals
            .where((element) => element.type == _filters[_filterHospital])
            .toList();
      }
    });
  }


  void _filteringClinic() {
    setState(() {
      if (_filterClinic == 0) {
        _filteredClinic = _clinics;
      } else {
        _filteredClinic = _clinics
            .where((element) => element.type == _filters[_filterClinic])
            .toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: Dimens.space16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.get.hospital,
                  style: TextStyles.h4,
                ),
                SpacerH(
                  value: Dimens.space16,
                ),
                InkWell(
                  onTap: (){
                    widget.switchToPage?.call(1);
                  },
                  child: Text(
                    Strings.get.seeAll,
                    style: TextStyles.body1.copyWith(color: Palette.primary),
                  ),
                )
              ],
            ),
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          Filter(
            filters: _filters,
            selectedIndex: _filterHospital,
            onChange: (index) {
              setState(() {
                _filterHospital = index;
                _filteringHospital();
              });
            },
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          ListView.separated(
            itemCount:
                _filteredHospital.length > 6 ? 6 : _filteredHospital.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            itemBuilder: (context, index) => Item1(
              data: _filteredHospital[index],
            ),
            separatorBuilder: (context, index) => SpacerV(
              value: Dimens.space16,
            ),
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          SizedBox(
            height: context.widthInPercent(30),
            child: ListView.separated(
              itemCount: dummyBanner.length,
              padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                ),
                child: ImageNetwork(
                  imageUrl: dummyBanner[index],
                  height: context.widthInPercent(30),
                  width: context.widthInPercent(80),
                ),
              ),
              separatorBuilder: (context, index) => SpacerH(
                value: Dimens.space16,
              ),
            ),
          ),
          SpacerV(
            value: Dimens.space24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.get.clinic,
                  style: TextStyles.h4,
                ),
                SpacerH(
                  value: Dimens.space16,
                ),
                InkWell(
                  onTap: (){
                    widget.switchToPage?.call(2);
                  },
                  child: Text(
                    Strings.get.seeAll,
                    style: TextStyles.body1.copyWith(color: Palette.primary),
                  ),
                )
              ],
            ),
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          Filter(
            filters: _filters,
            selectedIndex: _filterClinic,
            onChange: (index) {
              setState(() {
                _filterClinic = index;
                _filteringClinic();
              });
            },
          ),
          SpacerV(
            value: Dimens.space16,
          ),
          ListView.separated(
            itemCount:
            _filteredClinic.length > 6 ? 6 : _filteredClinic.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            itemBuilder: (context, index) => Item1(
              data: _filteredClinic[index],
            ),
            separatorBuilder: (context, index) => SpacerV(
              value: Dimens.space16,
            ),
          ),
        ],
      ),
    );
  }
}
