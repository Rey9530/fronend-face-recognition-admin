import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/routes/admin_handlers.dart';
import 'package:marcacion_admin/src/routes/companies_handlers.dart';
import 'package:marcacion_admin/src/routes/dashboard_handlers.dart';
import 'package:marcacion_admin/src/routes/employes_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String employesRoute = '/employes';
  static String companiesRoute = '/companies';

  static void configureRoutes() {
    // Auth Routes
    router.define(
      rootRoute,
      handler: AuthHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      loginRoute,
      handler: AuthHandlers.login,
      transitionType: TransitionType.none,
    );
    // router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none );

    // Dashboard
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.fadeIn,
    );

    // Dashboard
    router.define(
      employesRoute,
      handler: EmployesHandlers.list,
      transitionType: TransitionType.fadeIn,
    );

    // Dashboard
    router.define(
      companiesRoute,
      handler: CompaniesHandlers.list,
      transitionType: TransitionType.fadeIn,
    );

    // 404
    // router.notFoundHandler = NoPageFoundHandlers.noPageFound;
    router.notFoundHandler = AuthHandlers.login;
  }
}
