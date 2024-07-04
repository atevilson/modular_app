import 'dart:convert';

import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationsApp {
  Locale locale;
  Map<String, String> localizationString = {};

  LocalizationsApp(this.locale);

  Future<bool> load([Locale? newLocale]) async {
    if (newLocale != null) {
      locale = newLocale;
    }

    List<String> moduleGlobalAssets = [
      'packages/auth/assets/lang',
      'packages/home/assets/lang',
      'packages/product/assets/lang',
    ];

    for (String path in moduleGlobalAssets) {
      try {
        String jsonString =
            await rootBundle.loadString('$path/${locale.languageCode}.json');
        Map<String, dynamic> jsonMap = json.decode(jsonString);

        jsonMap.forEach((key, value) {
          localizationString[key] = value.toString();
        });
      } catch (e) {
        print("caminho não localizado $path: $e");
      }
    }

    return true;
  }

  String translate(String key) {
    return localizationString[key] ?? '[$key]';
  }

  String get appBarTitleHome => translate("appBarTitleHome");
  String get textTitulo => translate("textTitulo");
  String get textHome => translate("textHome");
  String get bottomLogin => translate("bottomLogin");
  String get bottonBack => translate("bottonBack");
  String get appBarTitleLogin => translate("appBarTitleLogin");
  String get appBarTitleProduct => translate("appBarTitleProduct");

  static LocalizationsApp of(BuildContext context) {
    return Localizations.of(context, LocalizationsApp);
  }

  static const LocalizationsDelegate<LocalizationsApp> delegate = LocalizationAppDelegate();
}
