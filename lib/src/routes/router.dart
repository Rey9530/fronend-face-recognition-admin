import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/routes/auth_handlers.dart';
import 'package:marcacion_admin/src/routes/companies_handlers.dart';
import 'package:marcacion_admin/src/routes/contract_handlers.dart';
import 'package:marcacion_admin/src/routes/dashboard_handlers.dart';
import 'package:marcacion_admin/src/routes/employes_handlers.dart';
import 'package:marcacion_admin/src/routes/reports_handlers.dart';
import 'package:marcacion_admin/src/routes/user_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String dashboardRoute = '/dashboard';
  static String employesRoute = '/employes';
  static String employeAddRoute = '/employes/create';
  static String employeEditRoute = '/employes/update/:uuid';
  static String companiesRoute = '/companies';
  static String userProfileRoute = '/profile';
  static String reportsRoute = '/reports';
  static String contractsRoute = '/contracts';
  static String contractsCreateRoute = '/contracts/create';
  static String contractsEditRoute = '/contracts/update/:uuid';

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

    // Dashboard
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.none,
    );

    // Ver employes
    router.define(
      employesRoute,
      handler: EmployesHandlers.list,
      transitionType: TransitionType.none,
    );

    // agregar empleados
    router.define(
      employeAddRoute,
      handler: EmployesHandlers.addEmploye,
      transitionType: TransitionType.none,
    );

    // editar empleados
    router.define(
      employeEditRoute,
      handler: EmployesHandlers.editEmploye,
      transitionType: TransitionType.none,
    );
    // empresas
    router.define(
      companiesRoute,
      handler: CompaniesHandlers.list,
      transitionType: TransitionType.none,
    );

    // Perfil
    router.define(
      userProfileRoute,
      handler: UserHandlers.view,
      transitionType: TransitionType.none,
    );

    // reportes
    router.define(
      reportsRoute,
      handler: ReportsHandlers.view,
      transitionType: TransitionType.none,
    );

    // Contratos/ proyectos
    router.define(
      contractsRoute,
      handler: ContractHandlers.view,
      transitionType: TransitionType.none,
    );
    router.define(
      contractsCreateRoute,
      handler: ContractHandlers.form,
      transitionType: TransitionType.none,
    );

    router.define(
      contractsEditRoute,
      handler: ContractHandlers.form,
      transitionType: TransitionType.none,
    );

    // 404
    // router.notFoundHandler = NoPageFoundHandlers.noPageFound;
    router.notFoundHandler = AuthHandlers.login;
  }
}
