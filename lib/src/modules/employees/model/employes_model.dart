// ignore_for_file: library_private_types_in_public_api

import 'package:intl/intl.dart';

class EmployesResponse {
  final List<Employe> data;
  final int status;
  final String message;

  EmployesResponse({
    required this.data,
    required this.status,
    required this.message,
  });

  factory EmployesResponse.fromJson(Map<String, dynamic> json) =>
      EmployesResponse(
        data: List<Employe>.from(json["data"].map((x) => Employe.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Employe {
  final String marcaEmpPk;
  final String empCodigo;
  final String empFechaNacimiento;
  final String empNombres;
  final String empApellidos;
  final String empEstado;
  final String marcaEmpEmpreFk;
  final DateTime empFeccrea;
  final DateTime empFecmod;
  final String empUsrcrea;
  final String empUsrmod;
  final String marcaEmpGenFk;
  final String marcaEmpUbiFk;
  final String marcaEmpCnFk;
  final MarcaGenGenero marcaGenGenero;
  final List<_MarcaAsigAsignacion> marcaAsigAsignacion;
  final _MarcaCnContratacion marcaCnContratacion;
  final _MarcaUbiUbicacion marcaUbiUbicacion;

  Employe({
    required this.marcaEmpPk,
    required this.empCodigo,
    required this.empFechaNacimiento,
    required this.empNombres,
    required this.empApellidos,
    required this.empEstado,
    required this.marcaEmpEmpreFk,
    required this.empFeccrea,
    required this.empFecmod,
    required this.empUsrcrea,
    required this.empUsrmod,
    required this.marcaEmpGenFk,
    required this.marcaEmpUbiFk,
    required this.marcaEmpCnFk,
    required this.marcaGenGenero,
    required this.marcaAsigAsignacion,
    required this.marcaCnContratacion,
    required this.marcaUbiUbicacion,
  });

  factory Employe.fromJson(Map<String, dynamic> json) => Employe(
        marcaEmpPk: json["marca_emp_pk"],
        empCodigo: json["emp_codigo"],
        empFechaNacimiento: DateFormat("dd/MM/y")
            .format(DateTime.parse(json["emp_fecha_nacimiento"])),
        empNombres: json["emp_nombres"],
        empApellidos: json["emp_apellidos"],
        empEstado: json["emp_estado"],
        marcaEmpEmpreFk: json["marca_emp_empre_fk"],
        empFeccrea: DateTime.parse(json["emp_feccrea"]),
        empFecmod: DateTime.parse(json["emp_fecmod"]),
        empUsrcrea: json["emp_usrcrea"],
        empUsrmod: json["emp_usrmod"],
        marcaEmpGenFk: json["marca_emp_gen_fk"],
        marcaEmpUbiFk: json["marca_emp_ubi_fk"],
        marcaEmpCnFk: json["marca_emp_cn_fk"],
        marcaGenGenero: MarcaGenGenero.fromJson(json["marca_gen_genero"]),
        marcaAsigAsignacion: List<_MarcaAsigAsignacion>.from(
            json["marca_asig_asignacion"]
                .map((x) => _MarcaAsigAsignacion.fromJson(x))),
        marcaCnContratacion:
            _MarcaCnContratacion.fromJson(json["marca_cn_contratacion"]),
        marcaUbiUbicacion:
            _MarcaUbiUbicacion.fromJson(json["marca_ubi_ubicacion"]),
      );

  Map<String, dynamic> toJson() => {
        "marca_emp_pk": marcaEmpPk,
        "emp_codigo": empCodigo,
        "emp_fecha_nacimiento": empFechaNacimiento,
        "emp_nombres": empNombres,
        "emp_apellidos": empApellidos,
        "emp_estado": empEstado,
        "marca_emp_empre_fk": marcaEmpEmpreFk,
        "emp_feccrea": empFeccrea.toIso8601String(),
        "emp_fecmod": empFecmod.toIso8601String(),
        "emp_usrcrea": empUsrcrea,
        "emp_usrmod": empUsrmod,
        "marca_emp_gen_fk": marcaEmpGenFk,
        "marca_emp_ubi_fk": marcaEmpUbiFk,
        "marca_emp_cn_fk": marcaEmpCnFk,
        "marca_gen_genero": marcaGenGenero.toJson(),
        "marca_asig_asignacion":
            List<dynamic>.from(marcaAsigAsignacion.map((x) => x.toJson())),
        "marca_cn_contratacion": marcaCnContratacion.toJson(),
        "marca_ubi_ubicacion": marcaUbiUbicacion.toJson(),
      };
}

class _MarcaAsigAsignacion {
  final String marcaAsigPk;
  final DateTime asigHoraInicio;
  final DateTime asigHoraFin;
  final String proyEstado;
  final DateTime asigFeccrea;
  final DateTime asigFecmod;
  final String asigUsrcrea;
  final String asigUsrmod;
  final String marcaAsigProyFk;
  final String marcaAsigEmpFk;

  _MarcaAsigAsignacion({
    required this.marcaAsigPk,
    required this.asigHoraInicio,
    required this.asigHoraFin,
    required this.proyEstado,
    required this.asigFeccrea,
    required this.asigFecmod,
    required this.asigUsrcrea,
    required this.asigUsrmod,
    required this.marcaAsigProyFk,
    required this.marcaAsigEmpFk,
  });

  factory _MarcaAsigAsignacion.fromJson(Map<String, dynamic> json) =>
      _MarcaAsigAsignacion(
        marcaAsigPk: json["marca_asig_pk"],
        asigHoraInicio: DateTime.parse(json["asig_hora_inicio"]),
        asigHoraFin: DateTime.parse(json["asig_hora_fin"]),
        proyEstado: json["proy_estado"],
        asigFeccrea: DateTime.parse(json["asig_feccrea"]),
        asigFecmod: DateTime.parse(json["asig_fecmod"]),
        asigUsrcrea: json["asig_usrcrea"],
        asigUsrmod: json["asig_usrmod"],
        marcaAsigProyFk: json["marca_asig_proy_fk"],
        marcaAsigEmpFk: json["marca_asig_emp_fk"],
      );

  Map<String, dynamic> toJson() => {
        "marca_asig_pk": marcaAsigPk,
        "asig_hora_inicio": asigHoraInicio.toIso8601String(),
        "asig_hora_fin": asigHoraFin.toIso8601String(),
        "proy_estado": proyEstado,
        "asig_feccrea": asigFeccrea.toIso8601String(),
        "asig_fecmod": asigFecmod.toIso8601String(),
        "asig_usrcrea": asigUsrcrea,
        "asig_usrmod": asigUsrmod,
        "marca_asig_proy_fk": marcaAsigProyFk,
        "marca_asig_emp_fk": marcaAsigEmpFk,
      };
}

class _MarcaCnContratacion {
  final String marcaCnPk;
  final String cnNombre;
  final String cnEstado;
  final DateTime cnFeccrea;
  final DateTime cnFecmod;
  final String cnUsrcrea;
  final String cnUsrmod;

  _MarcaCnContratacion({
    required this.marcaCnPk,
    required this.cnNombre,
    required this.cnEstado,
    required this.cnFeccrea,
    required this.cnFecmod,
    required this.cnUsrcrea,
    required this.cnUsrmod,
  });

  factory _MarcaCnContratacion.fromJson(Map<String, dynamic> json) =>
      _MarcaCnContratacion(
        marcaCnPk: json["marca_cn_pk"],
        cnNombre: json["cn_nombre"],
        cnEstado: json["cn_estado"],
        cnFeccrea: DateTime.parse(json["cn_feccrea"]),
        cnFecmod: DateTime.parse(json["cn_fecmod"]),
        cnUsrcrea: json["cn_usrcrea"],
        cnUsrmod: json["cn_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_cn_pk": marcaCnPk,
        "cn_nombre": cnNombre,
        "cn_estado": cnEstado,
        "cn_feccrea": cnFeccrea.toIso8601String(),
        "cn_fecmod": cnFecmod.toIso8601String(),
        "cn_usrcrea": cnUsrcrea,
        "cn_usrmod": cnUsrmod,
      };
}

class MarcaGenGenero {
  final String marcaGenPk;
  final String genNombre;
  final String genEstado;
  final DateTime genFeccrea;
  final DateTime genFecmod;
  final String genUsrcrea;
  final String genUsrmod;

  MarcaGenGenero({
    required this.marcaGenPk,
    required this.genNombre,
    required this.genEstado,
    required this.genFeccrea,
    required this.genFecmod,
    required this.genUsrcrea,
    required this.genUsrmod,
  });

  factory MarcaGenGenero.fromJson(Map<String, dynamic> json) => MarcaGenGenero(
        marcaGenPk: json["marca_gen_pk"],
        genNombre: json["gen_nombre"],
        genEstado: json["gen_estado"],
        genFeccrea: DateTime.parse(json["gen_feccrea"]),
        genFecmod: DateTime.parse(json["gen_fecmod"]),
        genUsrcrea: json["gen_usrcrea"],
        genUsrmod: json["gen_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_gen_pk": marcaGenPk,
        "gen_nombre": genNombre,
        "gen_estado": genEstado,
        "gen_feccrea": genFeccrea.toIso8601String(),
        "gen_fecmod": genFecmod.toIso8601String(),
        "gen_usrcrea": genUsrcrea,
        "gen_usrmod": genUsrmod,
      };
}

class _MarcaUbiUbicacion {
  final String marcaUbiPk;
  final String ubiNombre;
  final String ubiEstado;
  final DateTime ubiFeccrea;
  final DateTime ubiFecmod;
  final String ubiUsrcrea;
  final String ubiUsrmod;

  _MarcaUbiUbicacion({
    required this.marcaUbiPk,
    required this.ubiNombre,
    required this.ubiEstado,
    required this.ubiFeccrea,
    required this.ubiFecmod,
    required this.ubiUsrcrea,
    required this.ubiUsrmod,
  });

  factory _MarcaUbiUbicacion.fromJson(Map<String, dynamic> json) =>
      _MarcaUbiUbicacion(
        marcaUbiPk: json["marca_ubi_pk"],
        ubiNombre: json["ubi_nombre"],
        ubiEstado: json["ubi_estado"],
        ubiFeccrea: DateTime.parse(json["ubi_feccrea"]),
        ubiFecmod: DateTime.parse(json["ubi_fecmod"]),
        ubiUsrcrea: json["ubi_usrcrea"],
        ubiUsrmod: json["ubi_usrmod"],
      );

  Map<String, dynamic> toJson() => {
        "marca_ubi_pk": marcaUbiPk,
        "ubi_nombre": ubiNombre,
        "ubi_estado": ubiEstado,
        "ubi_feccrea": ubiFeccrea.toIso8601String(),
        "ubi_fecmod": ubiFecmod.toIso8601String(),
        "ubi_usrcrea": ubiUsrcrea,
        "ubi_usrmod": ubiUsrmod,
      };
}
