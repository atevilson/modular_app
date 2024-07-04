import 'package:get_it/get_it.dart';

import 'localizations_app.dart';
import 'package:flutter/material.dart';

class LocalizationAppDelegate extends LocalizationsDelegate<LocalizationsApp> {
  static List<String> supported = ["pt", "en", "es"];
  const LocalizationAppDelegate();

  @override
  bool isSupported(Locale locale) {
    return supported.contains(locale.languageCode);
  }

  @override
  Future<LocalizationsApp> load(Locale locale) async {
    var localizations = LocalizationsApp(locale);
    await localizations.load();
    GetIt.I.unregister<LocalizationsApp>();
    GetIt.I.registerLazySingleton<LocalizationsApp>(() => localizations);
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsApp> old) => true;
}
