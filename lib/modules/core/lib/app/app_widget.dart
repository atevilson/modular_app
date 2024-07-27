
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:common/main.dart';
import 'app_module.dart';

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
