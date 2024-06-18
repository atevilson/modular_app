

import 'package:app_modular/src/modules/auth/views/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/login', child: (_) => const LoginPage());
  }
}