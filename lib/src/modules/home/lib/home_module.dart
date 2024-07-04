

import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:home/views/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
  }
}
