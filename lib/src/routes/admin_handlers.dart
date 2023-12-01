import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/modules/auth/view/login_view.dart';
import 'package:marcacion_admin/src/modules/auth/viewmodel/provider_auth.dart';
import 'package:marcacion_admin/src/modules/dashboard/view/dashboard_view.dart';

import 'package:provider/provider.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });
}
