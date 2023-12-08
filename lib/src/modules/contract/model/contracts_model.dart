import 'package:intl/intl.dart';

class ContractsResponse {
  final List<Contract> data;
  final int status;
  final String message;

  ContractsResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory ContractsResponse.fromJson(Map<String, dynamic> json) =>
      ContractsResponse(
        data:
            List<Contract>.from(json["data"].map((x) => Contract.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Contract {
  final String marcaCtrPk;
  final String ctrNombre;
  final String ctrNumeroContrato;
  final int ctrHorasExtras;
  final String ctrFechaInicio;
  final String ctrFechaFin;
  final String ctrFechaInicioPro;
  final String ctrFechaFinPro;
  final String ctrEstado;
  final DateTime ctrFeccrea;
  final DateTime ctrFecmod;
  final String ctrUsrcrea;
  final String ctrUsrmod;
  final String marcaCtrEmpreFk;
  final MarcaEmpreEmpresas marcaEmpreEmpresas;

  Contract({
    required this.marcaCtrPk,
    required this.ctrNombre,
    required this.ctrNumeroContrato,
    required this.ctrHorasExtras,
    required this.ctrFechaInicio,
    required this.ctrFechaFin,
    required this.ctrFechaInicioPro,
    required this.ctrFechaFinPro,
    required this.ctrEstado,
    required this.ctrFeccrea,
    required this.ctrFecmod,
    required this.ctrUsrcrea,
    required this.ctrUsrmod,
    required this.marcaCtrEmpreFk,
    required this.marcaEmpreEmpresas,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
        marcaCtrPk: json["marca_ctr_pk"],
        ctrNombre: json["ctr_nombre"],
        ctrNumeroContrato: json["ctr_numero_contrato"],
        ctrHorasExtras: json["ctr_horas_extras"],
        ctrFechaInicio: DateFormat("dd/MM/y")
            .format(DateTime.parse(json["ctr_fecha_inicio"])),
        ctrFechaFin:
            DateFormat("dd/MM/y").format(DateTime.parse(json["ctr_fecha_fin"])),
        ctrFechaInicioPro: json["ctr_fecha_inicio_pro"] != null
            ? DateFormat("dd/MM/y")
                .format(DateTime.parse(json["ctr_fecha_inicio_pro"]))
            : "",
        ctrFechaFinPro: json["ctr_fecha_fin_pro"] != null
            ? DateFormat("dd/MM/y")
                .format(DateTime.parse(json["ctr_fecha_fin_pro"]))
            : "",
        ctrEstado: json["ctr_estado"],
        ctrFeccrea: DateTime.parse(json["ctr_feccrea"]),
        ctrFecmod: DateTime.parse(json["ctr_fecmod"]),
        ctrUsrcrea: json["ctr_usrcrea"],
        ctrUsrmod: json["ctr_usrmod"],
        marcaCtrEmpreFk: json["marca_ctr_empre_fk"],
        marcaEmpreEmpresas:
            MarcaEmpreEmpresas.fromJson(json["marca_empre_empresas"]),
      );

  Map<String, dynamic> toJson() => {
        "marca_ctr_pk": marcaCtrPk,
        "ctr_nombre": ctrNombre,
        "ctr_numero_contrato": ctrNumeroContrato,
        "ctr_horas_extras": ctrHorasExtras,
        "ctr_fecha_inicio": ctrFechaInicio,
        "ctr_fecha_fin": ctrFechaFin,
        "ctr_fecha_inicio_pro": ctrFechaInicioPro,
        "ctr_fecha_fin_pro": ctrFechaFinPro,
        "ctr_estado": ctrEstado,
        "ctr_feccrea": ctrFeccrea.toIso8601String(),
        "ctr_fecmod": ctrFecmod.toIso8601String(),
        "ctr_usrcrea": ctrUsrcrea,
        "ctr_usrmod": ctrUsrmod,
        "marca_ctr_empre_fk": marcaCtrEmpreFk,
        "marca_empre_empresas": marcaEmpreEmpresas.toJson(),
      };
}

class MarcaEmpreEmpresas {
  final String empreNombre;

  MarcaEmpreEmpresas({
    required this.empreNombre,
  });

  factory MarcaEmpreEmpresas.fromJson(Map<String, dynamic> json) =>
      MarcaEmpreEmpresas(
        empreNombre: json["empre_nombre"],
      );

  Map<String, dynamic> toJson() => {
        "empre_nombre": empreNombre,
      };
}
