
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';


final LocalizationsApp locale = GetIt.I<LocalizationsApp>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Locale newLocale) async {
    await locale.load(newLocale);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appBarTitleHome),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _onPressedLanguage,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Text(
                locale.textTitulo,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  locale.textHome,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Modular.to.navigate('/login'),
                child: Text(
                  locale.bottomLogin,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressedLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selecione o idioma'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _languageOption('Português', const Locale('pt', 'BR')),
              _languageOption('Inglês', const Locale('en', 'US')),
              _languageOption('Espanhol', const Locale('es', 'ES')),
            ],
          ),
        );
      },
    );
  }

  Widget _languageOption(String language, Locale locale) {
    return ListTile(
      title: Text(language),
      onTap: () {
        Navigator.of(context).pop();
        _changeLanguage(locale);
      },
    );
  }
}
