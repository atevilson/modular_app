
import 'package:app_modular/src/shared/localization/translate_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(TranslateApp(context).text("appBarTitleHome")),
      ),
      body: Column(
        children: [
           Center(child: Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Text(TranslateApp(context).text("appBarTitleProduct"), style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold
            ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: ElevatedButton(onPressed: () => Modular.to.navigate('/'), 
                child: Text(TranslateApp(context).text("bottonBack"), style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              ),
            ),
          ),
        ],
      ),
    );
  }

}