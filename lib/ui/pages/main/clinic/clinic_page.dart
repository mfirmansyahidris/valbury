import 'package:flutter/material.dart';
import 'package:valbury/core/core.dart';
import 'package:valbury/ui/ui.dart';
import 'package:valbury/utils/utils.dart';

class ClinicPage extends StatefulWidget {
  final VoidCallback? navigateToPage;
  const ClinicPage({Key? key, this.navigateToPage}) : super(key: key);

  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
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
        widget.navigateToPage?.call();
        return false;
      },
      child: Parent(
        appBar: context.appBar(
            title: Strings.get.clinic,
            isPrimary: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                widget.navigateToPage?.call();
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
