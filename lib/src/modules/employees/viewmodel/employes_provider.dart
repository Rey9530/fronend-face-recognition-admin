import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/employees/model/employes_model.dart';

class EmployesProvider extends ChangeNotifier {
  // final formKey = GlobalKey<FormState>();

  String? id;
  // var companyName = TextEditingController(text: "");
  // var companyAdress = TextEditingController(text: "");
  // var companyContact = TextEditingController(text: "");
  // var companyEmail = TextEditingController(text: "");
  // var companyPhone = TextEditingController(text: "");
  bool isReady = false;
  bool loading = false;

  // validarInput() {
  //   var ready = companyName.text.isNotEmpty &&
  //       companyAdress.text.isNotEmpty &&
  //       companyContact.text.isNotEmpty &&
  //       companyEmail.text.isNotEmpty &&
  //       companyPhone.text.isNotEmpty;

  //   if (ready != isReady) {
  //     isReady = ready;
  //     notifyListeners();
  //   }
  //   return isReady;
  // }

  // edit(Companie companie) {
  //   id = companie.marcaEmprePk;
  //   companyName.text = companie.empreNombre;
  //   companyAdress.text = companie.empreDireccion;
  //   companyContact.text = companie.empreContactoNombre;
  //   companyEmail.text = companie.empreContactoCorreo;
  //   companyPhone.text = companie.empreContactoTelefono;
  //   validarInput();
  // }

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
