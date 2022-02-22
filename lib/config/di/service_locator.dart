import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valbury/config/config.dart';

GetIt sl = GetIt.instance;

/// register prefManager
void initPrefManager(SharedPreferences _initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(_initPrefManager));
}
