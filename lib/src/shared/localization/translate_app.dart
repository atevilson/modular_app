
import 'package:app_modular/src/shared/localization/localizations_app.dart';
import 'package:flutter/material.dart';

class TranslateApp {
  final BuildContext context;

  TranslateApp(this.context);

  String text(String key) => LocalizationsApp.of(context).translate(key) ?? key;
}