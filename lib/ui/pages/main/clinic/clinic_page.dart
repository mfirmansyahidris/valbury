import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class ClinicPage extends StatefulWidget {
  const ClinicPage({Key? key}) : super(key: key);

  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Klinik",
        style: TextStyles.h4,
      ),
    );
  }
}
