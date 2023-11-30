import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/auth/model/models_auth.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';

class AuthProvider extends ChangeNotifier {
  final _dio = DioConexion();
  Future login(userCode, password) async {
    var data = {"user_code": "12345678", "password": "12345678"};
    try {
      var resp = await _dio.post_("users/login", data);
      if (resp!.data != null) {
        print("Afueraaa222");
        print(resp.data);
        var user = userModelFromJson(resp.data);
        print(user.toString());
      }
      return resp;
    } catch (e) {
      print("Afueraaa");
      print(e);
      return e;
    }
  }
}
