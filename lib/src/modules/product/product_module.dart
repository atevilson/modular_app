import 'package:app_modular/src/modules/product/views/product_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProdutModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/product', child: (_) => const ProductPage());
  }
}