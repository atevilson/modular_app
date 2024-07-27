
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:common/main.dart';

final LocalizationsApp locale = GetIt.I<LocalizationsApp>();

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appBarTitleHome),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Text(
                locale.appBarTitleProduct,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Modular.to.navigate('/'),
                child: Text(
                  locale.bottonBack,
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
}
