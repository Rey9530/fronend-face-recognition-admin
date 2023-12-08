import 'package:fluro/fluro.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/auth/viewmodel/provider_auth.dart';
import 'package:marcacion_admin/src/modules/contract/view/contracts_view.dart';
import 'package:marcacion_admin/src/modules/contract/view/form_contracts_view.dart';
import 'package:marcacion_admin/src/modules/views.dart';
import 'package:marcacion_admin/src/routes/router.dart';
import 'package:provider/provider.dart';

class ContractHandlers {
  static Handler view = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.contractsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ContractsView();
    } else {
      return const LoginView();
    }
  });

  static Handler form = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.contractsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const FormContractsView();
    } else {
      return const LoginView();
    }
  });
}
