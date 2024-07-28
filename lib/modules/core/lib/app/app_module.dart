
import 'package:auth/auth_module.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/home_module.dart';
import 'package:product/product_module.dart';

class AppModule extends Module {  
  // @override
  // List<Module> get imports => [
  //   HomeModule(),
  // ];
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/', module: HomeModule());
    r.module('/', module: ProductModule());
  }
}