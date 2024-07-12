
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:product/views/product_page.dart';

class ProductModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/product', child: (_) => const ProductPage());
  }
}