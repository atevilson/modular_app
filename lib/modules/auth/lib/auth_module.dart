
import 'package:auth/views/login_page.dart';
import 'package:commons_dependencies/commons_dependencies.dart';

class LoginModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/login', child: (_) => const LoginPage());
  }
}