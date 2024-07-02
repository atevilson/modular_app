
import 'package:app_modular/src/app_module.dart';
import 'package:app_modular/src/shared/localization/localizations_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectorDependence();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

Future<void> injectorDependence() async {
  Locale defaultLocale = const Locale("pt", "BR");
  LocalizationsApp localizationsApp = LocalizationsApp(defaultLocale);
  await localizationsApp.load();

  GetIt.I.registerLazySingleton<LocalizationsApp>(() => localizationsApp);
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
      routerConfig: Modular.routerConfig,
    );
  }
}
