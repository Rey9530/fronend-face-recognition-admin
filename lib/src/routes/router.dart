import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/routes/admin_handlers.dart';
import 'package:marcacion_admin/src/routes/dashboard_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  // Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth Routes
    router.define(
      rootRoute,
      handler: AuthHandlers.login,
      transitionType: TransitionType.none,
    );
    // router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none );
    // router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none );

    // Dashboard
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.fadeIn,
    );

    // 404
    // router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
