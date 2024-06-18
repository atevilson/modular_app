import 'package:flutter/material.dart';

import 'localization/translate_app.dart';

extension LocalizationExtends on String {
  String localizacao(BuildContext context) {
    return TranslateApp(context).text(this);
  }
}
