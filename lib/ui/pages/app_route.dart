import 'package:flutter/material.dart';
import 'package:the_klink_sehat/ui/pages/login/login_page.dart';
import 'package:the_klink_sehat/ui/ui.dart';

class AppRoute {
  AppRoute._();

  //define page route name
  static const String splashPage = "splash";
  static const String loginPage = "loginPage";
  static const String mainPage = "mainPage";

  //define page route
  static Map<String, WidgetBuilder> getRoutes({RouteSettings? settings}) => {
    splashPage: (_) => const SplashPage(),
    loginPage: (_) => const LoginPage(),
    mainPage: (_) => const MainPage(),
  };
}
