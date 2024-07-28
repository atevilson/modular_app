import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:common/main.dart';
import 'app_module.dart';

final LocalizationBloc bloc = GetIt.I<LocalizationBloc>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectorDependence();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'App modular',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                foregroundColor: Colors.white,
                color: Colors.black,
              ),
              primaryColor: Colors.blue,
            ),
            locale: state.locale,
            supportedLocales: const [
              Locale("pt", "BR"),
              Locale("en", "US"),
              Locale("es", "ES"),
            ],
            localizationsDelegates: const [
              LocalizationsApp.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerConfig: Modular.routerConfig,
          );
        },
      ),
    );
  }
}
