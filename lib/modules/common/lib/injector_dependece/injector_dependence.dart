
import 'package:common/main.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';

Future<void> injectorDependence() async {
  Locale defaultLocale = const Locale("pt", "BR");
  LocalizationsApp localizationsApp = LocalizationsApp(defaultLocale);
  await localizationsApp.load();

  GetIt.I.registerLazySingleton<LocalizationsApp>(() => localizationsApp);
  GetIt.I.registerLazySingleton<LocalizationBloc>(() => LocalizationBloc());
}