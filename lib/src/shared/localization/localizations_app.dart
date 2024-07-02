import 'dart:convert';

import 'package:app_modular/src/shared/localization/localization_app_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationsApp {
  Locale locale;
  Map<String, String>? localizationString;

  LocalizationsApp(this.locale, {this.localizationString});

  Future<bool> load([Locale? newLocale]) async {
    if (newLocale != null) {
      locale = newLocale;
    }
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizationString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key) {
    return localizationString?[key] ?? '[$key]';
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
