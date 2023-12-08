import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/auth/model/models_auth.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/modules/contract/model/contracts_model.dart';

class ContractsProvider extends ChangeNotifier {
  User? user;

  bool isReady = false;
  bool loading = false;
  int total = 0;

  updatePassword() async {
    var data = {
      "curren_password": "password.text",
    };

    try {
      loading = true;
      notifyListeners();
      final resp = await DioConexion.post_('/users/update/password', data);

      notifyListeners();
      if (resp['status'] != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // NotificationsService.showSnackbarError('Usuario / Password no válidos');
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  List<Contract> contracts = [];
  Future<bool> getContracts([load = false]) async {
    try {
      if (load) {
        loading = true;
        notifyListeners();
      }
      final resp = await DioConexion.get_('/contracts');
      final response = ContractsResponse.fromJson(resp);
      contracts = response.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      if (load) {
        loading = false;
      }
      notifyListeners();
    }
  }

  Future<bool> deleteContracts(String id) async {
    try {
      await DioConexion.delete_('/contracts/$id');
      NotificationsService.showSnackbarSuccess("Empleado Eliminada");
      await getContracts();
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }
}
