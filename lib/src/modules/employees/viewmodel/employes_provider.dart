import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/modules/companies/model/companies_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/code_employe_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/contratation_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/employes_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/gender_model.dart';
import 'package:marcacion_admin/src/modules/employees/model/sedes_model.dart';

class EmployesProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  String? uuid;
  var employeName = TextEditingController(text: "");
  var employeSurname = TextEditingController(text: "");
  var employeBirthdate = TextEditingController(text: "");
  var employeGender = TextEditingController(text: "0");
  var employeLocation = TextEditingController(text: "");
  var employeCompany = TextEditingController(text: "");
  var employeContact = TextEditingController(text: "");
  var employeHours = TextEditingController(text: "");
  var employeContratation = TextEditingController(text: "");
  var employeDateStart = TextEditingController(text: "");
  var employeDateEnd = TextEditingController(text: "");
  bool isReady = false;
  bool loading = false;

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

  Future<bool> getEmploye() async {
    try {
      final resp = await DioConexion.get_('/employes/$uuid');
      final response = EmployesResponse.fromJson(resp).data[0];
      employeCode = response.empCodigo;
      employeName = TextEditingController(text: response.empNombres);
      employeSurname = TextEditingController(text: response.empApellidos);
      employeBirthdate =
          TextEditingController(text: response.empFechaNacimiento);
      employeGender =
          TextEditingController(text: response.marcaGenGenero.marcaGenPk);
      employeLocation =
          TextEditingController(text: response.marcaUbiUbicacion.marcaUbiPk);
      employeCompany = TextEditingController(text: response.marcaEmpEmpreFk);
      // employeContact = TextEditingController(text: "");//TODO: PENDIENTE
      // employeHours = TextEditingController(text: "");//TODO: PENDIENTE
      employeContratation = TextEditingController(text: response.marcaEmpCnFk);
      employeDateStart = TextEditingController(text: ""); //TODO: PENDIENTE
      employeDateEnd = TextEditingController(text: ""); //TODO: PENDIENTE
      // employes = response;
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future saveEmploye() async {
    try {
      if (loading) return;
      loading = true;
      notifyListeners();
      var data = {
        "emp_codigo": employeCode,
        "emp_fecha_nacimiento": employeBirthdate.text,
        "emp_nombres": employeName.text,
        "emp_apellidos": employeSurname.text,
        "marca_emp_empre": employeCompany.text,
        "marca_emp_gen": employeGender.text,
        "marca_emp_ubi": employeLocation.text,
        "marca_emp_cn": employeContratation.text,
      };
      if (uuid != null) {
        await DioConexion.put_('/employes/$uuid', data);
        NotificationsService.showSnackbarSuccess("Empleado Actualizada");
      } else {
        await DioConexion.post_('/employes', data);
        NotificationsService.showSnackbarSuccess("Empleado Creada");
      }
      await getEmployes();
      NavigationService.goBack();
      return true;
    } catch (e) {
      print(e);
      return false;
    } finally {
      loading = false;
      // limpiar();
    }
  }

  String employeCode = '000000';
  Future generateCode(birthDate) async {
    try {
      if (loading) return;
      loading = true;
      notifyListeners();
      var data = {
        "emp_fecha_nacimiento": birthDate,
      };
      var resp = await DioConexion.post_('/employes/generatecode', data);
      var code = GenerateCodeResp.fromJson(resp);
      employeCode = code.data.code;
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  List<Sede> sedes = [];
  Future getSedes() async {
    try {
      if (loading) return;
      loading = true;
      // notifyListeners();
      var resp = await DioConexion.get_('/employes/get/sedes');
      var code = SedesResp.fromJson(resp);
      sedes = code.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      // notifyListeners();
    }
  }

  List<Companie> companies = [];
  Future getCompanies() async {
    try {
      if (loading) return;
      loading = true;
      // notifyListeners();
      var resp = await DioConexion.get_('/companies');
      var code = CompaniesResponse.fromJson(resp);
      companies = code.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      // notifyListeners();
    }
  }

  List<Contratation> contratations = [];
  Future getContratation() async {
    try {
      if (loading) return;
      loading = true;
      // notifyListeners();
      var resp = await DioConexion.get_('/employes/get/contratation');
      var code = ContratationResp.fromJson(resp);
      contratations = code.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      // notifyListeners();
    }
  }

  List<Gender> genders = [];
  Future getGenders() async {
    try {
      if (loading) return;
      loading = true;
      // notifyListeners();
      var resp = await DioConexion.get_('/employes/get/gender');
      var code = GenderResp.fromJson(resp);
      genders = code.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      // notifyListeners();
    }
  }

  Future getCatalogos(String? uui) async {
    uuid = uui;
    await getSedes();
    await getCompanies();
    await getContratation();
    await getGenders();
    if (uuid != null) {
      await getEmploye();
    } else {
      employeCode = '000000';
      employeName = TextEditingController(text: "");
      employeSurname = TextEditingController(text: "");
      employeBirthdate = TextEditingController(text: "");
      employeGender = TextEditingController(text: "0");
      employeLocation = TextEditingController(text: "");
      employeCompany = TextEditingController(text: "");
      employeContact = TextEditingController(text: "");
      employeHours = TextEditingController(text: "");
      employeContratation = TextEditingController(text: "");
      employeDateStart = TextEditingController(text: "");
      employeDateEnd = TextEditingController(text: "");
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
