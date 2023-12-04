import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/modules/auth/viewmodel/auth_provider.dart';
import 'package:marcacion_admin/src/modules/views.dart';
import 'package:provider/provider.dart';
// import 'package:marcacion_admin/src/modules/auth/viewmodel/provider_auth.dart';
// import 'package:marcacion_admin/src/modules/dashboard/view/dashboard_view.dart';

// import 'package:provider/provider.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      //TODO: resolver el redireccionamiento
      // NavigationService.replaceTo(Flurorouter.dashboardRoute);
      return const DashboardView();
    }

    // return const LoginView();
  });
}
