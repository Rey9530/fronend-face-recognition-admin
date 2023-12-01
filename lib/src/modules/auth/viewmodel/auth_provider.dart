import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/auth/model/models_auth.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/routes/router.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  // final _dio = DioConexion();
  AuthStatus authStatus = AuthStatus.checking;
  AuthProvider() {
    isAuthenticated();
  }

  User? user;
  login(String email, String password) {
    var data = {"user_code": "12345678", "password": "12345678"};

    DioConexion.post_('/users/login', data).then((json) {
      final authResponse = UserModel.fromJson(json);
      user = authResponse.data;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', user!.token);
      DioConexion.configureDio();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      // notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      print("Entramos aquoi");
      return false;
    }

    try {
      final resp = await DioConexion.get_('/users/check-status');
      final authReponse = UserModel.fromJson(resp);
      LocalStorage.prefs.setString('token', authReponse.data.token);
      user = authReponse.data;
      authStatus = AuthStatus.authenticated;
      print(user?.token);
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }
}
