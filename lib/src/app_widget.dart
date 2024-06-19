import 'package:app_modular/src/app_module.dart';
import 'package:app_modular/src/shared/localization/localizations_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Modular.to.addListener(() {
    debugPrint(Modular.to.path);
  });

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App modular',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white, color: Colors.black),
        primaryColor: Colors.blue,
      ),
      supportedLocales: const [
        Locale("pt", "BR"),
        Locale("en", "US"),        
        Locale("es", "ES")
      ],
      localizationsDelegates: const [
        LocalizationsApp.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocale) {
          return supportedLocale.firstWhere(
            (e) => 
                e.languageCode == locale?.languageCode &&
                e.countryCode == locale?.countryCode, 
            orElse: () => supportedLocale.first);
      },
      routerConfig: Modular.routerConfig,
    );
  }
}
