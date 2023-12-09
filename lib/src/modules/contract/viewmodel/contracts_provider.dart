import 'package:flutter/material.dart';
import 'package:marcacion_admin/src/common/services/services.dart';
import 'package:marcacion_admin/src/common/helpers/helpers.dart';
import 'package:marcacion_admin/src/modules/contract/model/companies_model.dart';
import 'package:marcacion_admin/src/modules/contract/model/contracts_model.dart';

class ContractsProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String? uuid;

  var contractName = TextEditingController();
  var contractsNumber = TextEditingController();
  var startDate = TextEditingController();
  var endDate = TextEditingController();
  var company = TextEditingController();
  var extraHours = TextEditingController(text: "0");
  bool isExtendable = false;
  var startDateExtendable = TextEditingController();
  var endDateExtendable = TextEditingController();

  bool isReady = false;
  bool loading = false;
  int total = 0;

  changeIsExtendable(valor) {
    isExtendable = valor;
    notifyListeners();
  }

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

  loadData(uui) async {
    uuid = uui;
    await getCompanies();
    if (uuid != null) await getRegister();
    if (uuid == null) await cleanForm();
  }

  Future<bool> cleanForm() async {
    try {
      contractName.text = '';
      contractsNumber.text = '';
      startDate.text = '';
      endDate.text = '';
      company.text = '';
      extraHours.text = '0';
      isExtendable = false;
      startDateExtendable.text = '';
      endDateExtendable.text = '';
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future<bool> getRegister() async {
    try {
      final resp = await DioConexion.get_('/contracts/$uuid');
      final response = Contract.fromJson(resp['data']);

      contractName.text = response.ctrNombre;
      contractsNumber.text = response.ctrNumContrato;
      startDate.text = response.ctrFechaInicio;
      endDate.text = response.ctrFechaFin;
      company.text = response.marEprEmpresas.eprCodigo;
      extraHours.text = response.ctrHorasExtras.toString();
      isExtendable = response.ctrFechaFinpro.isNotEmpty &&
          response.ctrFechaFinpro.isNotEmpty;
      startDateExtendable.text = response.ctrFechaFinpro;
      endDateExtendable.text = response.ctrFechaFinpro;
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  List<ContractCompanies> companies = [];
  Future<bool> getCompanies() async {
    try {
      final resp = await DioConexion.get_('/contracts/get/companies');
      final response = CompaniesResponse.fromJson(resp);
      companies = response.data;
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future saveContract() async {
    try {
      if (loading) return;
      loading = true;
      notifyListeners();

      var horasExtras = int.tryParse(extraHours.text) ?? 0;
      var data = {
        "ctr_nombre": contractName.text,
        "ctr_numero_contrato": contractsNumber.text,
        "horas_extras": horasExtras,
        "ctr_fecha_inicio": startDate.text,
        "ctr_fecha_fin": endDate.text,
        "ctr_fecha_inicio_pro": isExtendable ? startDateExtendable.text : null,
        "ctr_fecha_fin_pro": isExtendable ? endDateExtendable.text : null,
        "marca_ctr_empre": company.text,
      };
      if (uuid != null) {
        await DioConexion.put_('/contracts/$uuid', data);
        NotificationsService.showSnackbarSuccess("Contrato Actualizado");
      } else {
        await DioConexion.post_('/contracts', data);
        NotificationsService.showSnackbarSuccess("Contrato creado");
      }
      await getContracts();
      NavigationService.goBack();
      return true;
    } catch (e) {
      return false;
    } finally {
      loading = false;
      // limpiar();
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
