import 'dart:async';

import 'package:flutter/material.dart';
import 'package:the_klink_sehat/config/config.dart';
import 'package:the_klink_sehat/ui/ui.dart';
import 'package:the_klink_sehat/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _showCredit = false;

  @override
  void initState() {
    super.initState();
    _splash();
  }

  Future<Timer> _splash() async {
    var duration = const Duration(seconds: 2);

    await setLocale(sl<PrefManager>().locale);
    setState(() {
      _showCredit = true;
    });
    return Timer(duration, () async {
      if(sl<PrefManager>().email.isNullOrEmpty()){
        context.goToReplace(AppRoute.loginPage);
      }else{
        context.goToReplace(AppRoute.mainPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Images.launcherJpg,
                  width: context.widthInPercent(30),
                ),
                SpacerV(value: Dimens.space10,),
                Text(
                  Strings.get.appName,
                  style: TextStyles.h1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Palette.primaryDark
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: Dimens.space16,
            left: Dimens.space16,
            right: Dimens.space16,
            child: Visibility(
              visible: _showCredit,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "${Strings.get.createdBy} ",
                  style: TextStyles.body2,
                  children: [
                    TextSpan(
                      text: "${Strings.get.creator} ",
                      style: TextStyles.body2.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
