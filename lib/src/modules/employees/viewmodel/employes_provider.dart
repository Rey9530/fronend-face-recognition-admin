import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/employees/model/employes_model.dart';

class EmployesProvider extends ChangeNotifier {
  // final formKey = GlobalKey<FormState>();

  String? id;
  var employeName = TextEditingController(text: "");
  var employeSurname = TextEditingController(text: "");
  var employeBirthdate = TextEditingController(text: "");
  var employeGender = TextEditingController(text: "");
  var employeLocation = TextEditingController(text: "");
  var employeCompany = TextEditingController(text: "");
  var employeContact = TextEditingController(text: "");
  var employeHours = TextEditingController(text: "");
  var employeContratation = TextEditingController(text: "");
  var employeDateStart = TextEditingController(text: "");
  var employeDateEnd = TextEditingController(text: "");
  bool isReady = false;
  bool loading = false;

  // limpiar() {
  //   id = null;
  //   companyName = TextEditingController(text: "");
  //   companyAdress = TextEditingController(text: "");
  //   companyContact = TextEditingController(text: "");
  //   companyEmail = TextEditingController(text: "");
  //   companyPhone = TextEditingController(text: "");
  //   isReady = !isReady;
  //   validarInput();
  // }

  List<Employe> employes = [];
  Future<bool> getEmployes() async {
    try {
      final resp = await DioConexion.get_('/employes');
      final response = EmployesResponse.fromJson(resp);
      employes = response.data;
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future postEmployes() async {
    try {
      if (loading) return;
      loading = true;
      notifyListeners();
      var data = {
        "empre_nombre": "companyName.text",
      };
      if (id != null) {
        await DioConexion.put_('/employes/$id', data);

        NotificationsService.showSnackbarSuccess("Empleado Actualizada");
      } else {
        await DioConexion.post_('/employes', data);
        NotificationsService.showSnackbarSuccess("Empleado Creada");
      }
      await getEmployes();
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      loading = false;
      // limpiar();
    }
  }

  Future<bool> deleteEmployes(String id) async {
    try {
      await DioConexion.delete_('/employes/$id');
      NotificationsService.showSnackbarSuccess("Empleado Eliminada");
      await getEmployes();
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }
}
