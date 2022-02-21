import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  final String _kText = "text";
  final String _kLocale = "locale";

  final String _kEmail = "email";
  final String _kPhone = "phone";

  SharedPreferences preferences;

  PrefManager(this.preferences);

  set text(String? value) => preferences.setString(_kText, value ?? "");

  String get text => preferences.getString(_kText) ?? "";

  set locale(String? value) => preferences.setString(_kLocale, value ?? "en");

  String get locale => preferences.getString(_kLocale) ?? "en";

  set email(String? value) => preferences.setString(_kEmail, value ?? "");

  String get email => preferences.getString(_kEmail) ?? "";

  set phone(String? value) => preferences.setString(_kPhone, value ?? "");

  String get phone => preferences.getString(_kPhone) ?? "";
}
