import 'package:app_modular/src/shared/localization_extends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appBarTitleHome".locates(context)),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Text(
                    "textTitulo".locates(context),
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
                      "textHome".locates(context),
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
                      "bottomLogin".locates(context),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
