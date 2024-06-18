
import 'package:app_modular/src/modules/home/home_module.dart';
import 'package:app_modular/src/modules/auth/login_module.dart';
import 'package:app_modular/src/modules/product/product_module.dart';

import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/', module: HomeModule());
    r.module('/', module: ProdutModule());
  }
}