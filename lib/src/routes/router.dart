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
  static String employeAddRoute = '/employes/create';
  static String companiesRoute = '/companies';
  static String contractsRoute = '/contracts';

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
      transitionType: TransitionType.none,
    );

    // Employes
    router.define(
      employesRoute,
      handler: EmployesHandlers.list,
      transitionType: TransitionType.none,
    );

    router.define(
      employeAddRoute,
      handler: EmployesHandlers.addEmploye,
      transitionType: TransitionType.none,
    );

    // Dashboard
    router.define(
      companiesRoute,
      handler: CompaniesHandlers.list,
      transitionType: TransitionType.none,
    );

    // 404
    // router.notFoundHandler = NoPageFoundHandlers.noPageFound;
    router.notFoundHandler = AuthHandlers.login;
  }
}
