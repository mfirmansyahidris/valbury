import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Profile",
        style: TextStyles.h4,
      ),
    );
  }
}
