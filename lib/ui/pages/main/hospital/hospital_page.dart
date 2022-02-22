import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  _HospitalPageState createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Rs",
        style: TextStyles.h4,
      ),
    );
  }
}
