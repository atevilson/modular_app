
import 'package:common/main.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

final LocalizationBloc bloc = GetIt.I<LocalizationBloc>();

void _changeLanguage(Locale newLocale) async {
    bloc.add(ChangeLanguage(newLocale));
  }

void onPressedLanguage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Selecione o idioma'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _languageOption('Português', const Locale('pt', 'BR'), context),
            _languageOption('Inglês', const Locale('en', 'US'), context),
            _languageOption('Espanhol', const Locale('es', 'ES'), context),
          ],
        ),
      );
    },
  );
}

  Widget _languageOption(String language, Locale locale, BuildContext context) {
    return ListTile(
      title: Text(language),
      onTap: () {
        Navigator.of(context).pop();
        _changeLanguage(locale);
      },
    );
  }