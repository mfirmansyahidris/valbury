import 'package:flutter/material.dart';
import 'package:the_klink_sehat/core/core.dart';
import 'package:the_klink_sehat/ui/ui.dart';
import 'package:the_klink_sehat/utils/utils.dart';

class HospitalPage extends StatefulWidget {
  final VoidCallback? onBack;
  const HospitalPage({Key? key, this.onBack}) : super(key: key);

  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  final List<String> _filters = ["SEMUA", "BPJS", "Partner", "Terdekat"];
  final List<DataHelper> _hospitals = [];
  int _filterHospital = 0;

  List<DataHelper> _filteredHospital = [];

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
    _filteringHospital();
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.onBack?.call();
        return false;
      },
      child: Parent(
        appBar: context.appBar(
          title: Strings.get.hospital,
          isPrimary: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
              widget.onBack?.call();
            },
          )
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SpacerV(
                value: Dimens.space20,
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
                padding: EdgeInsets.symmetric(horizontal: Dimens.space20),
                itemBuilder: (context, index) => Item1(
                  data: _filteredHospital[index],
                ),
                separatorBuilder: (context, index) => SpacerV(
                  value: Dimens.space16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
