import 'package:valbury/utils/utils.dart';

class Strings {
  Strings._();

  static Strings get = Strings._();

  /// Clear strings after change language
  static void clear() {
    get = Strings._();
  }

  String appName = "Valbury";
  String cancel = "cancel".toLocale();
  String yes = "yes".toLocale();
  String save = "save".toLocale();
  String no = "no".toLocale();
  String close = "close".toLocale();
  String pleaseWait = "pleaseWait".toLocale();

  String loginAndRegistration = "loginAndRegistration".toLocale();
  String phoneNumber = "phoneNumber".toLocale();
  String email = "email".toLocale();
  String submit = "submit".toLocale();
  String invalidEmail = "invalidEmail".toLocale();
  String invalidPhone = "invalidPhone".toLocale();
  String loginSuccess = "loginSuccess".toLocale();
  String logout = "logout".toLocale();
  String confirmLogout = "confirmLogout".toLocale();

  String home = "home".toLocale();
  String hospital = "hospital".toLocale();
  String clinic = "clinic".toLocale();
  String profile = "profile".toLocale();
  String history = "history".toLocale();

  String viewDetail = "viewDetail".toLocale();
  String seeAll = "seeAll".toLocale();

  String createdBy = "createdBy".toLocale();
  String creator = "creator".toLocale();

}
